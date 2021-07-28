import 'package:MyFoodApp/screens/bottomnavbar/bookmark.dart';
import 'package:MyFoodApp/screens/bottomnavbar/profile.dart';
import 'package:MyFoodApp/screens/bottomnavbar/search.dart';
import 'package:MyFoodApp/screens/bottomnavbar/sell.dart';
import 'package:MyFoodApp/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:MyFoodApp/models/mealscontroller.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int current=0;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
    bottomNavigationBar: BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon:Icon(Icons.home_outlined,color: Colors.black),
          label:'Home',
        ),
        BottomNavigationBarItem(
          icon:Icon(Icons.add,color: Colors.black),
          label:'Add',
        ),
        BottomNavigationBarItem(
          icon:Icon(Icons.search_outlined,color: Colors.black),
          label:'Search',
        ),
        BottomNavigationBarItem(
          icon:Icon(Icons.book_outlined,color: Colors.black),
          label:'Book Mark',
        ),
        BottomNavigationBarItem(
          icon:Icon(Icons.person_outline,color: Colors.black),
          label:'Profile',
        ),

      ],
      currentIndex: current,
      onTap: (index){
        setState(() {
          current=index;
        });
      },
      
    ),
     body: ScopedModelDescendant(
        builder: (context, child, MealsController meals){
          if(current == 0){
            return HomePage(meals);
          }else if(current == 1){
            return Sell();
          }else if(current == 2){
            return Search();
          }else if(current == 3){
            return BookMark();
          }else{
            return Profile();
          }
        }
      ),
    );
  }
}