
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/get_home_dashboard_usecase.dart';

import 'home_event.dart';
import 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeDashboardUseCase _getHomeDashboard;

  HomeBloc(this._getHomeDashboard)
      : super(const HomeState.initial()) {
    on<HomeLoadEvent>(_onLoad);
    on<HomeRefreshEvent>(_onRefresh);
  }

  Future<void> _onLoad(
    HomeLoadEvent event,
    Emitter<HomeState> emit,
  ) async {
    await _loadDashboard(emit);
  }

  Future<void> _onRefresh(
    HomeRefreshEvent event,
    Emitter<HomeState> emit,
  ) async {
    await _loadDashboard(emit);
  }

  Future<void> _loadDashboard(
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.loading());

    try {
      final dashboard = await _getHomeDashboard();

      emit(
        HomeState.loaded(
          dashboard: dashboard,
        ),
      );
    } catch (e) {
      emit(
        HomeState.error(
          message: e.toString(),
        ),
      );
    }
  }
}
