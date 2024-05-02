import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_appp/restrunat/models/resturants_model.dart';
import 'package:task_appp/restrunat/repo.dart/resturants_repo.dart';

part 'resturants_state.dart';

class ResturantsCubit extends Cubit<ResturantsState> {
  ResturantsCubit(this.resturantsRepo) : super(ResturantsInitial());
  final ResturantsRepo resturantsRepo;

  getData() async {
    emit(ResturantsLoading());
    var results = await resturantsRepo.getResturants();
    results.fold((l) => emit(ResturantsFailure(errorMessage: l)),
        (r) => emit(ResturantsSuccess(resturants: r)));
  }
}
