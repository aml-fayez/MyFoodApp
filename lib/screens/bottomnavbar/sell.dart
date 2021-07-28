import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:MyFoodApp/models/mealscontroller.dart';
import 'package:MyFoodApp/widgets/loadind.dart';


class Sell extends StatefulWidget {
  @override
  _SellState createState() => _SellState();
}

class _SellState extends State<Sell> {

TextEditingController titleController = TextEditingController();
TextEditingController priceController = TextEditingController();

GlobalKey<FormState> titleKey = GlobalKey<FormState>();
GlobalKey<FormState> priceKey = GlobalKey<FormState>();

var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                margin: EdgeInsets.all(15.0),
                height: 200.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: AssetImage('images/login.jpg'),
                    fit: BoxFit.fill
                  ),
                ),
              ),
              field('Meal Title', Icons.text_fields, TextInputType.text, titleController, titleKey),
              field('Meal Price', Icons.attach_money, TextInputType.number, priceController, priceKey),
              Column(
                children: [
                  ScopedModelDescendant(
                    builder: (context, child, MealsController meals){
                      return Builder(
                        builder: (BuildContext context){
                          return FlatButton(
                            child: meals.isAddMealsLoading == true ? Center(child: Loading()) : Text(
                              'Sell',
                              style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            color: Colors.black,
                            onPressed: () {
                              if(!_formKey.currentState.validate()){
                                Scaffold.of(context).showSnackBar(snack('Some Field Required!'));
                              }else{
                                meals.addMeal(titleController.text, double.parse(priceController.text), 'https://www.wcrf-uk.org/sites/default/files/Apple_A-Z%20Fruit1.jpg');
                                return null;
                              }
                            },
                          );
                        }
                      );
                    }
                  ),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
  snack(String content){
    return SnackBar(
      content: Text(content),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
    );
  }
  field(String label, IconData icon, TextInputType type, TextEditingController controller, Key key) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        key: key,
        validator: (value){
          if(value.isEmpty){
            return 'this field required';
          }else{
            return null;
          }
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.black, width: 0.5)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.black, width: 0.5)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.black, width: 0.5)
          ),
          prefixIcon: Icon(icon, color: Colors.black),
          labelText: label
        ),
        textInputAction: TextInputAction.done,
        keyboardType: type,
        controller: controller
      ),
    );
  }
}