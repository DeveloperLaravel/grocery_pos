import 'package:injectable/injectable.dart';
import '../repositories/backup_repository.dart';

@injectable
class SignInGoogleDrive {
  final BackupRepository repository;
  SignInGoogleDrive(this.repository);

  // ignore: strict_top_level_inference, always_declare_return_types
  call() => repository.signIn();
}
