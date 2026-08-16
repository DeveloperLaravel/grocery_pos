import 'package:flutter/material.dart';
import 'package:grocery_pos/features/backup/backup.dart';

void openBackupPage(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => const BackupPage(),
    ),
  );
}
