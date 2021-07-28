import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  final double itemWidth;
  final double imageHeight;
  final String image;
  final String title;
  final double price;
   bool pressed= false;
  Item(this.itemWidth,this.imageHeight,this.image,this.title,this.price);
   @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
bool pressed= false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.itemWidth,
      margin: EdgeInsets.all(15.0),  
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child:Column(
                  children:[
                    Container(
                    height: widget.imageHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        image:NetworkImage(widget.image),
                        fit: BoxFit.fill,
                         ),
                    ),
                    ),
                  ListTile(
                    title:Text(widget.title,
                    style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 18.0,
                     color: Colors.black,
                     ),
                      ),
                      subtitle: Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${widget.price.toString()}\$',
                          style: TextStyle(
                            color:Colors.grey,
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,
                             ),
                             ),
                             IconButton(
                              icon: Icon(pressed == false ? Icons.favorite_border : Icons.favorite),
                               iconSize: 20.0,
                               color: Colors.red,
                              onPressed: () {
                                setState(() {
                               pressed = !pressed;
                              });
                               
                               },
                             ),
                        ],
                        ),
                  ),
                ],
                ),
              );
      
    
  }
}
