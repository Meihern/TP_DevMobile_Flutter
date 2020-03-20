import 'package:first_app/camera.dart';
import 'package:first_app/gallery.dart';
import 'package:first_app/weather-form.dart';
import 'package:first_app/weather.dart';
import "package:flutter/material.dart";
import "./quizz.dart";
void main() => runApp(MaterialApp(home: MyApp()));



class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
          Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[Colors.deepOrange, Colors.white])
                ),
                child: Center(
                  child: CircleAvatar(
                      radius: 50, backgroundImage: AssetImage('./images/flutter_logo.png')
                  )
              ),
              ),
              ListTile(
                title: Text("Quizz", style: TextStyle(fontSize: 20),),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Quiz()));
                },
              ),
              Divider(color: Colors.grey, thickness: 2,),
              ListTile(
                title: Text("Weather", style: TextStyle(fontSize: 20),),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WeatherForm()));
                },
              ),
              Divider(color: Colors.grey, thickness: 2,),
              ListTile(
                title: Text("Gallery", style: TextStyle(fontSize: 20),),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Gallery()));
                },
              ),
              Divider(color: Colors.grey, thickness: 2,),
              ListTile(
                title: Text("Camera", style: TextStyle(fontSize: 20),),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CameraPage()));
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text("MyApp"),
        ),
        body: Center(
          child: Text("Hello World !", style: TextStyle(
            fontSize: 22,
            color: Colors.red
          ),),
        ),
      );
  }

}