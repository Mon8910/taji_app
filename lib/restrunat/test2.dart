import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_appp/cubit/cubit/category_cubit.dart';
import 'package:task_appp/cubit/cubit/resturants_cubit.dart';
import 'package:task_appp/restrunat/models/category_model.dart';
import 'package:task_appp/restrunat/models/resturants_model.dart';

class Test2 extends StatelessWidget {
  const Test2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Explore by category',
            style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 15,
          ),
          BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
             if(state is CategorySuccess){
               return CategoryRestaurant(category: state.category,);
             }else if(state is CategoryFailure){
              return Text(state.message);
             }
             else{
              return const Center(
                  child: CircularProgressIndicator(),
                );
             }
            },
          ),
          BlocBuilder<ResturantsCubit, ResturantsState>(
            builder: (context, state) {
              if (state is ResturantsSuccess) {
                return CardRestaurant(
                  resturants: state.resturants,
                );
              } else if (state is ResturantsFailure) {
                return Text(state.errorMessage);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

//==================
class CategoryRestaurant extends StatelessWidget {
  const CategoryRestaurant({super.key, required this.category});
  final List<CategoryModel>category;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .13,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: category.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .1,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                           height: 100,

                          decoration:  BoxDecoration(
                              color: Colors.red,
                              image: DecorationImage(
                                  image:
                                      NetworkImage(category[index].image?['url']?? 'https://storage.tajj.xyz/1/uploads-Categories-b0197645-e451-4c37-bd53-9e9121e1203c.png'),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                    ),
                     Text(
                    category[index].name['en'],
                      style:const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 0, 0, 0)),
                      maxLines: 1,
                    ),
                  ],
                ));
          }),
    );
  }
}

class CardRestaurant extends StatelessWidget {
  const CardRestaurant({super.key, required this.resturants});
  final List<ResturantsModel> resturants;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .4,
      child: ListView.builder(
          itemCount: resturants.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: AspectRatio(
                          aspectRatio: 3 / 2,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        resturants[index].image!['url']),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 20,
                        top: 20,
                        child: Image.asset(
                          'assets/images/love.png',
                        ),
                      ),
                      Positioned(
                        top: 230,
                        right: 10,
                        child: Image.asset(
                          'assets/images/food2.png',
                          fit: BoxFit.fill,
                          height: 100,
                          width: 100,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    resturants[index].name!['en'],
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Dubai, Deira',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 91, 91, 91)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Dine on authentic Persian food',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 43, 100, 138)),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            );
          }),
    );
  }
}
