import 'package:first_app/weather.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherForm extends StatefulWidget{
  @override
  _WeatherFormState createState() => _WeatherFormState();

}


class _WeatherFormState extends State<WeatherForm>{
  String city;
  TextEditingController cityEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(hintText: "Enter a city name ..."),
                controller: cityEditingController,
                onChanged: (String city){
                  setState(() {
                    this.city = city;
                  });
                },
                onSubmitted: (String city){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Weather(city)));
                  cityEditingController.text="";
                },
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: RaisedButton(
              child: Text("Get Weather"),
              textColor: Colors.white,
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Weather(city)));
                cityEditingController.text="";
              },
              color: Colors.deepOrangeAccent,
            )
          )
        ],
      ),
    );
  }

}