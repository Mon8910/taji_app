part of 'hotelscuibt_cubit.dart';

@immutable
sealed class HotelscuibtState {}

final class HotelscuibtInitial extends HotelscuibtState {}
final class HotelscuibtLoading extends HotelscuibtState {}
final class HotelscuibtSuccess extends HotelscuibtState {
  final List<HotelModels>hotelsModel;

  HotelscuibtSuccess({required this.hotelsModel});
}
final class HotelscuibtFailure extends HotelscuibtState {
  final String errorMessage;

  HotelscuibtFailure({required this.errorMessage});
}
