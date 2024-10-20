import 'package:coffee_app/home_screen.dart';
import 'package:flutter/material.dart';
class WelcomeScreen extends StatelessWidget{
@override
Widget build(BuildContext context){
  return Material(
    child: Container(
    padding: const EdgeInsets.only(top: 110, bottom: 40),
    decoration:  BoxDecoration(
      color:  Colors.grey[800],
      image: DecorationImage(
        image: AssetImage("images/logo-color.png"),
        opacity: 0.6,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Good to the Last Sip",
          style:TextStyle(
            color: Colors.white.withOpacity(0.8),
            height: 1,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
          ),),   
          SizedBox(height: 80),
          Material(
            color: Colors.black,
                borderRadius: BorderRadius.circular(10),
            child: InkWell( 
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(),));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 35),
              child: Text("Grab A Coffee",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight:FontWeight.bold,
                letterSpacing: 1,
              ),),
            ),),
          )
        ],
      ),
    ),
  );
}
} 