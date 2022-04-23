import 'package:elmenues/view/home/home_screen.dart';
import 'package:elmenues/view/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors';


class HomeNavigate extends StatefulWidget {
  @override
  _HomeNavigateState createState() => _HomeNavigateState();
}

class _HomeNavigateState extends State<HomeNavigate> {
  void dispose() {
    super.dispose();
  }
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    Container(),
    Container(),
    ProfileView(),


  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  @override

  Widget build(BuildContext context) {


    return Scaffold(
      body: _children[_currentIndex],

      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(
            color: Color(0xffC4C4C4),
            style: BorderStyle.solid
          )
          )
        ),
        child: BottomNavigationBar(
          selectedLabelStyle: TextStyle(fontSize: 12,color:appColor.primary, ),
          unselectedFontSize: 12,
          iconSize: 50,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          backgroundColor: Colors.white,
          selectedItemColor: appColor.primary.withOpacity(0.5),
          items:  [
            BottomNavigationBarItem(

              activeIcon: Icon(Icons.motorcycle,color:appColor.primary),
              icon: Icon(Icons.motorcycle),
                label: 'Delivery',

            ),
            BottomNavigationBarItem(
                activeIcon:Icon(Icons.restaurant,color: appColor.primary,),

                icon:Icon(Icons.restaurant),
                label: 'Dine Out'

            ),
            BottomNavigationBarItem(
                activeIcon:Icon(Icons.assignment,color: appColor.primary,),
                icon:Icon(Icons.assignment),
                label: 'Orders'

            ),
            BottomNavigationBarItem(
                activeIcon:Icon(Icons.person,color: appColor.primary,),
                icon:Icon(Icons.person),
                label: 'ME'

            )
          ],
        ),
      ),
    );
  }

}