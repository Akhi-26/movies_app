import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movies_app/Views/Homepage.dart';
import 'package:movies_app/Views/searchScreen.dart';
import 'package:movies_app/views/detailScreen.dart';

import '../Views/favouriteScreen.dart';

class NavBar extends StatefulWidget {
   NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _navigationBarState();
}

class _navigationBarState extends State<NavBar> {
  int _selectedIndex = 0;
  final List<Widget> _screens=[
    HomePage(),
    SearchScreen(),
    FavouriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _screens[_selectedIndex],
      bottomNavigationBar: GNav(
        gap: 8,
        selectedIndex: _selectedIndex,
        onTabChange: (index){
          setState((){
            _selectedIndex=index;
          });
        },
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        backgroundColor: Colors.black,
        color: Colors.red,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.red,
        tabMargin: EdgeInsets.all(5),
        tabs: [
          GButton(
            icon: Icons.home,
            text: ("Home"),
          ),
          GButton(
            icon: Icons.search,
            text: ("Search"),
          ),
          GButton(
            icon: Icons.favorite_border_outlined,
            text: "Favorites",
          )
        ]),
    );
  }
}
