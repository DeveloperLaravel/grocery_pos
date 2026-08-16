import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/backup_usecases.dart';
import 'backup_event.dart';
import 'backup_state.dart';

@injectable
class BackupBloc extends Bloc<BackupEvent, BackupState> {
  final ConnectGoogleDrive connect;
  final DisconnectGoogleDrive disconnect;
  final IsGoogleDriveConnected isConnected;
  final GetBackups getBackups;
  final CreateBackup createBackup;
  final RestoreBackup restoreBackup;
  final DeleteBackup deleteBackup;

  BackupBloc(
    this.connect,
    this.disconnect,
    this.isConnected,
    this.getBackups,
    this.createBackup,
    this.restoreBackup,
    this.deleteBackup,
  ) : super(const BackupState()) {
    on<BackupStarted>((e, emit) async {
      emit(state.copyWith(loading: true, error: null));
      final r = await isConnected().run();
      await r.match(
        (f) async => emit(state.copyWith(loading: false, error: f.message)),
        (ok) async {
          emit(state.copyWith(loading: false, connected: ok));
          if (ok) await _load(emit);
        },
      );
    });

    on<BackupConnectRequested>((e, emit) async {
      emit(state.copyWith(loading: true, error: null));
      final r = await connect().run();
      await r.match(
        (f) async => emit(state.copyWith(loading: false, error: f.message)),
        (_) async {
          emit(state.copyWith(
            loading: false,
            connected: true,
            message: 'تم ربط Google Drive.',
          ));
          await _load(emit);
        },
      );
    });

    on<BackupDisconnectRequested>((e, emit) async {
      final r = await disconnect().run();
      r.match(
        (f) => emit(state.copyWith(error: f.message)),
        (_) => emit(const BackupState(message: 'تم فصل Google Drive.')),
      );
    });

    on<BackupRefreshRequested>((e, emit) => _load(emit));

    on<BackupCreateRequested>((e, emit) async {
      emit(state.copyWith(loading: true, error: null));
      final r = await createBackup().run();
      await r.match(
        (f) async => emit(state.copyWith(loading: false, error: f.message)),
        (_) async {
          emit(state.copyWith(
            loading: false,
            message: 'تم إنشاء النسخة الاحتياطية.',
          ));
          await _load(emit);
        },
      );
    });

    on<BackupRestoreRequested>((e, emit) async {
      emit(state.copyWith(loading: true, error: null));
      final r = await restoreBackup(e.id).run();
      r.match(
        (f) => emit(state.copyWith(loading: false, error: f.message)),
        (_) => emit(state.copyWith(
          loading: false,
          restartRequired: true,
          message: 'تمت الاستعادة. أعد تشغيل التطبيق الآن.',
        )),
      );
    });

    on<BackupDeleteRequested>((e, emit) async {
      emit(state.copyWith(loading: true, error: null));
      final r = await deleteBackup(e.id).run();
      await r.match(
        (f) async => emit(state.copyWith(loading: false, error: f.message)),
        (_) async {
          emit(state.copyWith(loading: false, message: 'تم حذف النسخة.'));
          await _load(emit);
        },
      );
    });
  }

  Future<void> _load(Emitter<BackupState> emit) async {
    emit(state.copyWith(loading: true, error: null));
    final r = await getBackups().run();
    r.match(
      (f) => emit(state.copyWith(loading: false, error: f.message)),
      (items) => emit(state.copyWith(
        loading: false,
        connected: true,
        backups: items,
      )),
    );
  }
}
