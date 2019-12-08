import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import './cityname.dart';

import 'package:clima/utilities/constants.dart';
import '../services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationweather});

  final locationweather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  int temperature;

  String weatherIcon;
  String weathermessage;
  String cityname;
  @override
  void initState() {
    super.initState();
    updateUi(widget.locationweather);
  }

  void updateUi(dynamic weatherdata) {
    setState(() {
      if (weatherdata == null) {
        temperature = 0;
        weatherIcon = 'error';
        weathermessage = 'unable to weatherdata';
        cityname = '';
        return;
      }

      double temp = weatherdata['main']['temp'].toDouble();
      temperature = temp.toInt();
      int weatherid = weatherdata['weather'][0]['id'];

      weatherIcon = weatherModel.getWeatherIcon(weatherid);
      weathermessage = weatherModel.getMessage(temperature);
      cityname = weatherdata['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          body:   Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/location_background.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8), BlendMode.dstATop),
              ),
            ),
          //  constraints: BoxConstraints.expand(),
         //   child: SafeArea(
              child: Column(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
               //  crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                  
                  
                  
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () async {
                            var weatherdata =
                                await weatherModel.getlocationweather();
                            updateUi(weatherdata);
                          },
                          child: Icon(
                            Icons.near_me,
                            size: 50.0,
                          ),
                        ),
                        FlatButton(
                          onPressed: ()async {
                            var typedname = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Cityname();
                                },
                              ),
                            );
                          if(typedname != null)
                          {
                           
                           var weatherdata = await weatherModel.getcityWeather(typedname);
                            updateUi(weatherdata);
                          }
                          },
                          child: Icon(
                            Icons.location_city,
                            size: 50.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox( height: MediaQuery.of(context).size.height * 0.30,),
                  Container(
                   
                    //  child: // Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: <Widget>[
                        Text('$temperature°', style: TextStyle(fontSize: 80)),
                        Text(weatherIcon, style: TextStyle(fontSize: 80)),
                      ],
                    ),
                    //  ),
                  ),
                        SizedBox( height: MediaQuery.of(context).size.height * 0.10,),
                  Container(
                    height: MediaQuery.of(context).size.height * .10,
                    child: Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text(
                        "$weathermessage in $cityname!",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        
        );
  }
}
// double temperature = decodedata['main']['temp'];
//   int condition = decodedata['weather'][0]['id'];
//   String loction = decodedata['name'];
