import 'package:flutter/material.dart';

void main (){
  runApp(
    MaterialApp(
      title: "Stateful App Example",
      home: FavoriteCity(),
    )
  );//funct
}

class FavoriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
   return _FavoriteCityState();
  }

}

class _FavoriteCityState extends State <FavoriteCity>{

 String nameCity = "";
 var _currencies = ['RTGS', 'Dollar', 'Pound','Others'];
 var _currentItemSelected = 'RTGS';
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Stateful App Example"),
     ),
     body: Container(
       margin: EdgeInsets.all(20.0),
       child: Column(
         children: <Widget>[
           TextField(
             onSubmitted: (String userInput){
               setState(() {
                 nameCity = userInput;
               });

             },
           ),
           DropdownButton<String>(
             items: _currencies.map((String dropDownStringItem){
               return DropdownMenuItem<String>(
                 value: dropDownStringItem,
                 child: Text(dropDownStringItem),
               );
             }).toList(),
             onChanged: (String newValueSlected){
               //your code to execute, when a menu item is selected from dropdown
               setState(() {
                 this._currentItemSelected = newValueSlected;
               });
             },

             //propety to enforce that when a menu item is selected something happens
             value: _currentItemSelected,
             //this value property will actually notify which item is selected
             //by the user as well as assingning the new selected value to the variable
             //_currentItemSelected within the setState() function

           ),
           Padding(
             padding: EdgeInsets.all(30.0),
             child:Text(
               "Your best city is $nameCity",
               style: TextStyle(fontSize: 20.0),
           ))
         ],
       ),
     ),
   );
  }
}