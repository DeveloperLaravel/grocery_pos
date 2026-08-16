import 'package:injectable/injectable.dart';
import '../repositories/backup_repository.dart';

@injectable
class GetBackups {
  final BackupRepository repository;
  GetBackups(this.repository);

  // ignore: always_declare_return_types, strict_top_level_inference
  call() => repository.getBackups();
}
