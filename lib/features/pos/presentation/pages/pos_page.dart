import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injection.dart';

import '../bloc/pos_bloc.dart';
import '../bloc/pos_event.dart';
import 'pos_view.dart';

class PosPage extends StatelessWidget {
  const PosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PosBloc>()..add(const PosEvent.loadRequested()),
      child: const PosView(),
    );
  }
}
