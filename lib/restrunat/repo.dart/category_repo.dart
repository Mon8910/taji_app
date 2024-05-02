import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:task_appp/api/api_consumer.dart';
import 'package:task_appp/error/error_exception.dart';
import 'package:task_appp/restrunat/models/category_model.dart';

class CategoryRepo {
  final ApiConsumer apiConsumer;

  CategoryRepo({required this.apiConsumer});
  Future<Either<String, List<CategoryModel>>> getAllCategory() async {
    try {
      final data = await apiConsumer.get('meta/categories');
      final List<CategoryModel> category = [];
      for (var e in data) {
        category.add(CategoryModel.fromJson(e));
      }
      log('===================$data');
      return Right(category);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
}
