import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grocery_pos/core/di/injection.dart';
import 'package:grocery_pos/features/inventory/presentation/bloc/inventory_bloc.dart';
import 'package:grocery_pos/features/inventory/presentation/bloc/inventory_event.dart';
import 'package:grocery_pos/features/inventory/presentation/bloc/inventory_state.dart';
import 'package:grocery_pos/features/inventory/presentation/widgets/inventory_content.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<InventoryBloc>()..add(const InventoryEvent.started()),
      child: const _InventoryView(),
    );
  }
}

class _InventoryView extends StatelessWidget {
  const _InventoryView();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InventoryBloc, InventoryState>(
      listenWhen: (previous, current) =>
          previous.error != current.error ||
          previous.message != current.message,
      listener: (context, state) {
        final message = state.error ?? state.message;
        if (message == null || message.isEmpty) return;

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(message),
            ),
          );
      },
      builder: (context, state) {
        return InventoryContent(
          state: state,
          onRefresh: () async {
            context
                .read<InventoryBloc>()
                .add(const InventoryEvent.refreshed());
          },
          onSearchChanged: (value) {
            context
                .read<InventoryBloc>()
                .add(InventoryEvent.searchChanged(value));
          },
          onLowStockToggled: () {
            context
                .read<InventoryBloc>()
                .add(const InventoryEvent.lowStockToggled());
          },
        );
      },
    );
  }
}
