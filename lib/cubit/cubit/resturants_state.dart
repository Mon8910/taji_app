part of 'resturants_cubit.dart';

@immutable
sealed class ResturantsState {}

final class ResturantsInitial extends ResturantsState {}

final class ResturantsLoading extends ResturantsState {}

final class ResturantsSuccess extends ResturantsState {
  final List<ResturantsModel> resturants;

  ResturantsSuccess({
    required this.resturants,
  });
}

final class ResturantsFailure extends ResturantsState {
  final String errorMessage;

  ResturantsFailure({required this.errorMessage});
}
