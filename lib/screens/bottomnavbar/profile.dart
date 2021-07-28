import 'package:flutter/material.dart';
import 'package:MyFoodApp/screens/bottomnavbar/sign.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
      backgroundColor:Colors.transparent,
      elevation: 0.0,
      leading:
        Icon(Icons.arrow_back,color: Colors.black),
       title:Text('Profile',
       style:TextStyle(
          fontWeight:FontWeight.bold,
          color: Colors.black,
       ),
      ),
    ),
    body:Container(
      margin: EdgeInsets.all(20.0),
      child:ListView(
          scrollDirection: Axis.vertical,
          children: [
        Container(
        
        margin: EdgeInsets.all(10.0),
        child: Row(
          children:[
            Container(
        margin: EdgeInsets.all(15.0),
        height: 100.0,
        width: MediaQuery.of(context).size.width/3.5,
        decoration:BoxDecoration(
        shape:BoxShape.circle,
        image:DecorationImage(
          image:NetworkImage('https://avatars.githubusercontent.com/u/44323531?s=400&u=4a0966bc4213dfd7da98c0ca07273948bc32bfad&v=4'),
          fit:BoxFit.fill, 
        ),
       ),
        ),
          Text(
           'Bassel Allam',
           style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold)
            )
    
          ],
        ),
        ),  
            profileItem('baseljahen@gmail.com', Icons.email),
            profileItem('****', Icons.lock),
            profileItem('15 - july - 1970', Icons.calendar_today),
        Column(
        children: [
         Builder(
           builder:(BuildContext context){
            return TextButton(
              child:Text('Sign Out',
              style:  TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              style:ButtonStyle(
                backgroundColor:MaterialStateProperty.all(Colors.black),
              ),
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (_){return SignIn();}));
              },
            );
           }
         ),
        ],
        ),
          ],
        ),
       
        ), 
    );
  }
}
 
  profileItem(String title,IconData icon){
  return Container(
        margin: EdgeInsets.all(15.0),
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color:Colors.white, 
        ),
      child: ListTile(
        leading:Icon(icon,color:Colors.black),
         title: Text( title ,
         style: TextStyle(
           fontWeight:FontWeight.bold,
           fontSize: 19.0,
           color: Colors.black,
            ),
            ),
         trailing:Icon(Icons.edit,color:Colors.black), 
         ),
  );
}
