
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/home_dashboard.dart';

part 'home_state.freezed.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState.initial() = HomeInitial;

  const factory HomeState.loading() = HomeLoading;

  const factory HomeState.loaded({
    required HomeDashboard dashboard,
  }) = HomeLoaded;

  const factory HomeState.error({
    required String message,
  }) = HomeError;
}
