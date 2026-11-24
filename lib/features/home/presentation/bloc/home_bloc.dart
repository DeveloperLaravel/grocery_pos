
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
    on<HomeLoadEvent>(_onStarted);
    on<HomeRefreshEvent>(_onRefreshed);
  }

  Future<void> _onStarted(
    HomeLoadEvent event,
    Emitter<HomeState> emit,
  ) async {
    await _loadDashboard(emit);
  }

  Future<void> _onRefreshed(
    HomeRefreshEvent event,
    Emitter<HomeState> emit,
  ) async {
    await _loadDashboard(emit);
  }

  Future<void> _loadDashboard(
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.loading());

    final result = await _getHomeDashboard();

    result.fold(
      (failure) {
        emit(
          HomeState.error(
            message: failure.message,
          ),
        );
      },
      (dashboard) {
        emit(
          HomeState.loaded(
            dashboard: dashboard,
          ),
        );
      },
    );
  }
}