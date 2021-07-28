import 'package:MyFoodApp/screens/bottomnavbar/result.dart';
import 'package:MyFoodApp/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:MyFoodApp/screens/bottomnavbar/searchMap.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:MyFoodApp/models/mealscontroller.dart';
import 'package:MyFoodApp/widgets/loadind.dart';


class HomePage extends StatefulWidget {
  final MealsController meals;
   HomePage(this.meals);
 
  @override

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
void initState() {
  widget.meals.getMeals();
  super.initState();
}

  Map<int,List> data ={
 0:[
   'https://machahid24.com/wp-content/uploads/2017/12/5114e1a4392eee3185be6036cf20c1f47b7beffe.jpg',
   'Vegetables Salads',
   50.0,
    ] ,
 1:[
    'https://img.youm7.com/ArticleImgs/2017/3/26/250716-maxresdefault.jpg',
    'Ice Cream',
    60.0
    ],
2: [
    'https://californiaavocado.com/wp-content/uploads/2020/07/avocado-fruit-berry.jpg',
    'Avocado',
     600.0
  ],
3: [
    'https://www.wcrf-uk.org/sites/default/files/Apple_A-Z%20Fruit1.jpg',
    'Apple',
    100.0
  ],
 4:
    [
    'https://2rdnmg1qbg403gumla1v9i2h-wpengine.netdna-ssl.com/wp-content/uploads/sites/3/2016/10/healthyFruit-517472788-770x533-1-650x428.jpg',
    'Roman',
     200.0
  ],
 };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey[100] ,
      appBar:AppBar(
        backgroundColor:Colors.transparent,
        elevation: 0.0,
        title: Text('DISCOVER',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color:Colors.black,
          fontSize: 20.0,
        ),
        ),
      ) ,
      body:Container(
        child:ListView(
          scrollDirection: Axis.vertical,
          children :[
            Container(
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(20.0),
              ),
            child:ListTile(
                title: Text(
                  'Search on Map',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal
                  ),
                ), 
                trailing:Icon(Icons.location_on,color:Colors.grey,size: 25.0,) ,
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(fullscreenDialog: true,builder:(_){return SearchMap();}));
                },
            ),
            ),
           headLineItem('Featured Item'),
           Container(
              height: 290.0,
              child: scrollItem(350.0, 170.0),
           ),
      headLineItem('Trending'),
         Container(
              height: 250.0,
              child: scrollItem(200.0, 140.0),
           ),
        headLineItem('Hot Offers'),
            Container(
              height: 250.0,
              child: scrollItem(200.0, 140.0)
            ),
       
       ],  
      ),
   
      
    ),
    );
  }

headLineItem(String title){
  return ListTile(
         title: Text( title ,
         style: TextStyle(
           fontWeight:FontWeight.bold,
           fontSize: 20.0,
           color: Colors.black,
            ),
            ),
            trailing: Text('View More',
            style: TextStyle(
              color:Colors.grey,
              fontSize: 15.0,
              fontWeight: FontWeight.normal,
               ),
               ),
               onTap: (){
                 Navigator.push(context,MaterialPageRoute(builder: (_){return Results(title);}));
               },
         );
}
scrollItem(double itemWidth,double imageHeight){
   return ScopedModelDescendant(
      builder: (context, child, MealsController meals){
        if(meals.isGetMealsLoading == true){
          return Center(child: Loading());
        }else if(meals.allMeals.isEmpty){
          return Center(child: Text('No Meals Found'));
        }else{
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: meals.allMeals.length,
            itemBuilder: (context, index){
              return Item(itemWidth, imageHeight, meals.allMeals[index].image, meals.allMeals[index].title, meals.allMeals[index].price,);
            }
          );
        }
      } 
    );
}
}