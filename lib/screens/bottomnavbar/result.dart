import 'package:flutter/material.dart';
import 'package:MyFoodApp/widgets/item.dart';
class Results extends StatefulWidget {
  final String className;
  Results(this.className);

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
 Map<int, List> data = {
  0 : [
    'https://www.healthyeating.org/images/default-source/home-0.0/nutrition-topics-2.0/general-nutrition-wellness/2-2-2-2foodgroups_vegetables_detailfeature.jpg?sfvrsn=226f1bc7_6',
    'Fruites',
    200.5
  ],
  1 : [
    'https://www.verywellfit.com/thmb/a4580FjTjbub9q4kI5m9X-Po-p0=/2002x1334/filters:no_upscale():max_bytes(150000):strip_icc()/Bananas-5c6a36a346e0fb0001f0e4a3.jpg',
    'Banana',
    500.0
  ],
  2 : [
    'https://2rdnmg1qbg403gumla1v9i2h-wpengine.netdna-ssl.com/wp-content/uploads/sites/3/2016/10/healthyFruit-517472788-770x533-1-650x428.jpg',
    'Roman',
    200.0
  ],
  3 : [
    'https://www.wcrf-uk.org/sites/default/files/Apple_A-Z%20Fruit1.jpg',
    'Apple',
    100.0
  ],
  4 : [
    'https://californiaavocado.com/wp-content/uploads/2020/07/avocado-fruit-berry.jpg',
    'Avocado',
    600.0
  ],
  5 : [
    'https://www.healthyeating.org/images/default-source/home-0.0/nutrition-topics-2.0/general-nutrition-wellness/2-2-2-2foodgroups_vegetables_detailfeature.jpg?sfvrsn=226f1bc7_6',
    'Fruites',
    200.5
  ],
  6 : [
    'https://www.verywellfit.com/thmb/a4580FjTjbub9q4kI5m9X-Po-p0=/2002x1334/filters:no_upscale():max_bytes(150000):strip_icc()/Bananas-5c6a36a346e0fb0001f0e4a3.jpg',
    'Banana',
    500.0
  ],
  7 : [
    'https://2rdnmg1qbg403gumla1v9i2h-wpengine.netdna-ssl.com/wp-content/uploads/sites/3/2016/10/healthyFruit-517472788-770x533-1-650x428.jpg',
    'Roman',
    200.0
  ],
  8 : [
    'https://www.wcrf-uk.org/sites/default/files/Apple_A-Z%20Fruit1.jpg',
    'Apple',
    100.0
  ],
  9 : [
    'https://californiaavocado.com/wp-content/uploads/2020/07/avocado-fruit-berry.jpg',
    'Avocado',
    600.0
  ],
};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
      backgroundColor:Colors.transparent,
      elevation: 0.0,
       title:Text(
        '${widget.className}',
       style:TextStyle(
          fontWeight:FontWeight.bold,
          color: Colors.black,
          fontSize: 20.0,
       ),
      ),
      iconTheme:IconThemeData(color:Colors.black),
      leading:IconButton(
       icon:Icon(Icons.arrow_back_ios),
       onPressed: (){
         Navigator.pop(context);
       },
    ),
      ),
      body:Container(
        margin:EdgeInsets.all(10.0),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:2,
            childAspectRatio: 1, ),
          itemCount: data.length,
          itemBuilder:(context,index){
              return Item(150.0,79.0,data[index][0],data[index][1],data[index][2]);
        }   
     ),
      ),
    );
  }
}