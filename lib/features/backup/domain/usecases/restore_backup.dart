import 'package:injectable/injectable.dart';
import '../repositories/backup_repository.dart';

@injectable
class RestoreBackup {
  final BackupRepository repository;
  RestoreBackup(this.repository);

  // ignore: always_declare_return_types, strict_top_level_inference
  call(String fileId) => repository.restoreBackup(fileId);
}
