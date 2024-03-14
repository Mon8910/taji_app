import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_appp/hotel/peresntation/view/widgets/test1.dart';
import 'package:task_appp/restrunat/test2.dart';
import 'package:tuple/tuple.dart';

class HotelBodyView extends StatefulWidget {
  const HotelBodyView({super.key});

  @override
  State<HotelBodyView> createState() => _HotelBodyViewState();
}

class _HotelBodyViewState extends State<HotelBodyView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final List<Tuple2> pages = [
    const Tuple2('assets/images/photo1.png', Test1()),
    const Tuple2('assets/images/phot2.png', Test2())
  ];
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                pages[tabController.index].item1,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
              const Positioned(
                left: 175,
                top: 30,
                child: Text(
                  'Taji',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
              Positioned(
                top: 200,
                left: 50,
                child: SizedBox(
                  height: 70,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: TabBar(
                                  labelColor: Colors.white,
                                  unselectedLabelColor:
                                      Color.fromARGB(255, 43, 100, 138),
                                  indicatorColor:
                                      const Color.fromARGB(255, 43, 100, 138),
                                  indicatorWeight: 2,
                                  indicator: BoxDecoration(
                                      color: Color.fromARGB(255, 43, 100, 138),
                                      borderRadius: BorderRadius.circular(10)),
                                  controller: tabController,
                                  tabs: const [
                                    Tab(
                                      child: Row(
                                        children: [
                                          Icon(FontAwesomeIcons.hotel),
                                          SizedBox(
                                            width: 10,
                                          )
                                          // Image.asset('assets/images/hotel3.png',height: 30,),
                                          ,
                                          Text('hotel')
                                        ],
                                      ),
                                    ),
                                    Tab(
                                      child: Row(
                                        children: [
                                          Icon(Icons.restaurant),
                                          SizedBox(
                                            width: 10,
                                          )
                                          // Image.asset('assets/images/hotel3.png',height: 30,),
                                          ,
                                          Text('restaurant')
                                        ],
                                      ),
                                    )
                                  ]),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Expanded(
              child: TabBarView(
                  controller: tabController, children: [Test1(), Test2()]))
        ],
      ),
    );
  }
}
