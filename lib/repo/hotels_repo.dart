import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:task_appp/api/api_consumer.dart';
import 'package:task_appp/error/error_exception.dart';
import 'package:task_appp/models/hotels_model.dart';

class HotelsRepo {
  final ApiConsumer apiConsumer;

  HotelsRepo({required this.apiConsumer});
  Future<Either<String,List<HotelModels>>> getAllHotels()async{
    try {
  final response=await apiConsumer.get('users/hotels');
  final List<HotelModels> hotels=[];
  for(var hotelss in response['data']){
    hotels.add(HotelModels.fromJson(hotelss));
  }
  print(response);
  
  return Right(hotels);
} on ServerException catch (e) {
      return Left(e.errorModel.message);
}
    

  }

}