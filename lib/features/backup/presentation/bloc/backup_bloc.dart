import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/create_backup.dart';
import '../../domain/usecases/delete_backup.dart';
import '../../domain/usecases/get_backups.dart';
import '../../domain/usecases/restore_backup.dart';
import '../../domain/usecases/sign_in_google_drive.dart';
import '../../domain/usecases/sign_out_google_drive.dart';
import 'backup_event.dart';
import 'backup_state.dart';

@injectable
class BackupBloc extends Bloc<BackupEvent, BackupState> {
  final SignInGoogleDrive signInGoogleDrive;
  final SignOutGoogleDrive signOutGoogleDrive;
  final GetBackups getBackups;
  final CreateBackup createBackup;
  final RestoreBackup restoreBackup;
  final DeleteBackup deleteBackup;

  BackupBloc(
    this.signInGoogleDrive,
    this.signOutGoogleDrive,
    this.getBackups,
    this.createBackup,
    this.restoreBackup,
    this.deleteBackup,
  ) : super(const BackupState()) {
    on<BackupStarted>(_onStarted);
    on<BackupSignInRequested>(_onSignIn);
    on<BackupSignOutRequested>(_onSignOut);
    on<BackupCreateRequested>(_onCreate);
    on<BackupRestoreRequested>(_onRestore);
    on<BackupDeleteRequested>(_onDelete);
    on<BackupRefreshRequested>(_onRefresh);
  }

  Future<void> _onStarted(
    BackupStarted event,
    Emitter<BackupState> emit,
  ) async {
    await _loadBackups(emit);
  }

  Future<void> _onSignIn(
    BackupSignInRequested event,
    Emitter<BackupState> emit,
  ) async {
    emit(state.copyWith(
      loading: true,
      error: null,
      message: null,
    ));

    final result = await signInGoogleDrive().run();

    await result.match(
      (failure) async {
        emit(state.copyWith(
          loading: false,
          error: failure.message,
        ));
      },
      (email) async {
        emit(state.copyWith(
          loading: false,
          email: email,
          message: 'تم الاتصال بحساب Google',
        ));
        await _loadBackups(emit);
      },
    );
  }

  Future<void> _onSignOut(
    BackupSignOutRequested event,
    Emitter<BackupState> emit,
  ) async {
    final result = await signOutGoogleDrive().run();

    result.match(
      (failure) => emit(state.copyWith(error: failure.message)),
      (_) => emit(const BackupState(
        message: 'تم تسجيل الخروج',
      )),
    );
  }

  Future<void> _onCreate(
    BackupCreateRequested event,
    Emitter<BackupState> emit,
  ) async {
    emit(state.copyWith(
      loading: true,
      error: null,
      message: null,
    ));

    final result = await createBackup().run();

    await result.match(
      (failure) async {
        emit(state.copyWith(
          loading: false,
          error: failure.message,
        ));
      },
      (_) async {
        emit(state.copyWith(
          loading: false,
          message: 'تم إنشاء النسخة الاحتياطية',
        ));
        await _loadBackups(emit);
      },
    );
  }

  Future<void> _onRestore(
    BackupRestoreRequested event,
    Emitter<BackupState> emit,
  ) async {
    emit(state.copyWith(
      loading: true,
      error: null,
      message: null,
    ));

    final result = await restoreBackup(event.fileId).run();

    result.match(
      (failure) => emit(state.copyWith(
        loading: false,
        error: failure.message,
      )),
      (_) => emit(state.copyWith(
        loading: false,
        restartRequired: true,
        message:
            'تمت استعادة البيانات. أغلق التطبيق وافتحه من جديد الآن.',
      )),
    );
  }

  Future<void> _onDelete(
    BackupDeleteRequested event,
    Emitter<BackupState> emit,
  ) async {
    emit(state.copyWith(loading: true, error: null));

    final result = await deleteBackup(event.fileId).run();

    await result.match(
      (failure) async {
        emit(state.copyWith(
          loading: false,
          error: failure.message,
        ));
      },
      (_) async {
        emit(state.copyWith(
          loading: false,
          message: 'تم حذف النسخة',
        ));
        await _loadBackups(emit);
      },
    );
  }

  Future<void> _onRefresh(
    BackupRefreshRequested event,
    Emitter<BackupState> emit,
  ) async {
    await _loadBackups(emit);
  }

  Future<void> _loadBackups(
    Emitter<BackupState> emit,
  ) async {
    emit(state.copyWith(
      loading: true,
      error: null,
    ));

    final signInResult = await signInGoogleDrive().run();

    final email = signInResult.fold(
      (_) => state.email,
      (value) => value,
    );

    final result = await getBackups().run();

    result.match(
      (failure) => emit(state.copyWith(
        loading: false,
        email: email,
        error: failure.message,
      )),
      (items) => emit(state.copyWith(
        loading: false,
        email: email,
        backups: items,
      )),
    );
  }
}
