import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:task_appp/hotel/peresntation/view/widgets/test1.dart';
import 'package:task_appp/hotel_body.dart';
import 'package:task_appp/restrunat/test2.dart';
import 'package:task_appp/search_view.dart';

// ignore: must_be_immutable
class HomeView extends StatefulWidget{
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final control=PersistentTabController(initialIndex: 0);
   List<Widget> screens = const [ HotelBodyView(), SearchView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PersistentTabView(context, screens: screens,
      controller: control,
      items: [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
          title: 'home',
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.black

        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.search),
          title: 'search',
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.black

        )
        
      ],
      decoration: NavBarDecoration(),
      navBarStyle: NavBarStyle.style6,) ,
    );
      
    
  }
}