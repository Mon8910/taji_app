import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:task_appp/api/api_consumer.dart';
import 'package:task_appp/error/error_exception.dart';
import 'package:task_appp/restrunat/models/resturants_model.dart';

class ResturantsRepo {
  final ApiConsumer apiConsumer;

  ResturantsRepo({
    required this.apiConsumer,
  });
  Future<Either<String, List<ResturantsModel>>> getResturants() async {
    try {
      final data = await apiConsumer.get('users/restaurants');
      final List<ResturantsModel> restaurants = [];
      for (var elements in data['data']) {
        restaurants.add(ResturantsModel.fromJson(elements));
      }
      
      return Right(restaurants);
    } on ServerException catch (e) {
      return  Left(e.errorModel.message);
    }
  }
}
