import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_appp/core/constant/widgets.dart';
import 'package:task_appp/cubit/cubit/category_cubit.dart';
import 'package:task_appp/cubit/hotelscuibt_cubit.dart';
import 'package:task_appp/models/hotels_model.dart';
import 'package:task_appp/restrunat/models/category_model.dart';

class Test1 extends StatelessWidget {
  const Test1({super.key});
  @override
  Widget build(BuildContext context) {
    return  SafeArea(

      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child:  Text(
                    'Explore by category',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
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
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'All Hotels',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<HotelscuibtCubit, HotelscuibtState>(
              builder: (context, state) {
                if(state is HotelscuibtSuccess){
                  return AllHotelsCard(hotelModel: state.hotelsModel,);
                }
                else if(state is HotelscuibtFailure){
                  return Text(state.errorMessage);
                }
                else  {
                  return CircularProgressIndicator();
                }
                
              },
            ),
          )
        ],
      ),
    );
    
  }
}

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
class AllHotelsCard extends StatelessWidget {
  const AllHotelsCard({super.key, required this.hotelModel});
 final List<HotelModels> hotelModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: hotelModel.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: AspectRatio(
                      aspectRatio: 1.1,
                      child: Container(
                        decoration:  BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage('${hotelModel[index].image?["url"]}'),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  HotelsItem(text:hotelModel[index].name!['en'] ,location: hotelModel[index].location!['addressable_type'],),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            );
          }),
    );
  }
}

//========
class HotelsItem extends StatelessWidget {
  const HotelsItem({super.key, required this.text, required this.location,});
  final String text;
  final String location;
  
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 0, 0, 0)),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(Icons.location_on_rounded),
              SizedBox(
                height: 10,
              ),
              Text(
                location,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                
                style: TextStyle(
                  
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 91, 91, 91)),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                '149',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                'AED',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color.fromARGB(255, 43, 100, 138)),
              ),
              SizedBox(
                width: 10,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Per night',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 43, 100, 138))),
                TextSpan(
                    text: ' Inclusive of all taxes',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 0, 0, 0)))
              ]))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Standard Room City View',
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 0, 0, 0)),
          ),
          SizedBox(
            height: 3,
          ),
          Divider(
            thickness: 4,
            color: Color.fromARGB(255, 235, 235, 235),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ContestantIcon(
                image: 'assets/images/wifii.png',
                text: 'Wifi',
              ),
              SizedBox(
                width: 18,
              ),
              ContestantIcon(
                image: 'assets/images/quite.png',
                text: 'Quite',
              ),
              SizedBox(
                width: 18,
              ),
              ContestantIcon(
                image: 'assets/images/library2.png',
                text: 'Library',
              ),
              SizedBox(
                width: 18,
              ),
              ContestantIcon(
                image: 'assets/images/cafee.png',
                text: 'Cafe',
              ),
              SizedBox(
                width: 18,
              ),
              ContestantIcon(
                image: 'assets/images/quite.png',
                text: 'Quite',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
