import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_appp/api/dio_consumer.dart';
import 'package:task_appp/cubit/cubit/resturants_cubit.dart';
import 'package:task_appp/cubit/hotelscuibt_cubit.dart';
import 'package:task_appp/home.dart';
import 'package:task_appp/hotel_body.dart';
import 'package:task_appp/repo/hotels_repo.dart';
import 'package:task_appp/restrunat/repo.dart/resturants_repo.dart';
import 'package:task_appp/restrunat/test2.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) =>
          HotelscuibtCubit(HotelsRepo(apiConsumer: DioConsumer(dio: Dio())))
            ..getAllData(),
      child: const MainPage(),
    ),
  );
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HotelscuibtCubit(
                HotelsRepo(apiConsumer: DioConsumer(dio: Dio(),),),)
              ..getAllData(),
          ),
          BlocProvider(
            create: (context) => ResturantsCubit(
              ResturantsRepo(
                apiConsumer: DioConsumer(
                  dio: Dio(),
                ),
              ),
            )..getData()
          )
        ],
        child: const MaterialApp(
          home: HomeView(),
        ));
    //  return const MaterialApp(
    //   home: HomeView(),

    //  );
  }
}
