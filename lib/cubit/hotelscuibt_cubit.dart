import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_appp/models/hotels_model.dart';
import 'package:task_appp/repo/hotels_repo.dart';

part 'hotelscuibt_state.dart';

class HotelscuibtCubit extends Cubit<HotelscuibtState> {
  HotelscuibtCubit(this.hotelsRepo) : super(HotelscuibtInitial());
  final HotelsRepo hotelsRepo;
  getAllData() async {
emit(HotelscuibtLoading());
    
    final response = await hotelsRepo.getAllHotels();
    response.fold((l) => emit(HotelscuibtFailure(errorMessage: l)),
        (r) => emit(HotelscuibtSuccess(hotelsModel: r)));
  }
}
