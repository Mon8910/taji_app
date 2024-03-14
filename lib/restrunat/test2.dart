import 'package:flutter/material.dart';

class Test2 extends StatelessWidget {
  const Test2({super.key});

  @override
  Widget build(BuildContext context) {
    return const
       SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explore by category',
              style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15,
            ),
            CategoryRestaurant(),
            CardRestaurant()
          ],
        ),
      );
    
  }
}

//==================
class CategoryRestaurant extends StatelessWidget {
  const CategoryRestaurant({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .13,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
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
                          //  height: 100,

                          decoration: const BoxDecoration(
                              color: Colors.red,
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/category.png'),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                    ),
                    const Text(
                      'data words',
                      style: TextStyle(
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
  const CardRestaurant({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .4,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      AspectRatio(
                        aspectRatio: 3 / 2,
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/food.png'),
                                  fit: BoxFit.fill)),
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
                  const Text(
                    'Madaen Restaurant',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
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
