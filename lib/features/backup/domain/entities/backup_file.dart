class BackupFile {
  final String id;
  final String name;
  final DateTime? modifiedTime;
  final int? sizeBytes;

  const BackupFile({
    required this.id,
    required this.name,
    this.modifiedTime,
    this.sizeBytes,
  });
}
