import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_appp/restrunat/models/category_model.dart';
import 'package:task_appp/restrunat/repo.dart/category_repo.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryRepo) : super(CategoryInitial());
  final CategoryRepo categoryRepo;
  getAll() async {
    emit(CategoryLoading());
    var results = await categoryRepo.getAllCategory();
    results.fold(
      (l) => emit(CategoryFailure(message: l)),
      (r) => emit(
        CategorySuccess(category: r),
      ),
    );
  }
}
