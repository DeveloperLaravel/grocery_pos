
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injection.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

import '../widgets/dashboard_card.dart';
import '../widgets/states/loading_view.dart';
import '../widgets/states/error_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeBloc>()
        ..add(const HomeEvent.load()),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const LoadingView(),

                error: (message) => ErrorView(
                  message: message,
                ),

                loaded: (dashboard) => DashboardView(
                  dashboard: dashboard,
                ),

                orElse: () => const LoadingView(),
              );
            },
          ),
        ),
      ),
    );
  }
}
