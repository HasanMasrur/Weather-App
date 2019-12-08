import 'package:flutter/material.dart';

class Cityname extends StatefulWidget {
  @override
  @override
  State<StatefulWidget> createState() {
    return _Cityname();
  }
}

class _Cityname extends State<Cityname> {
  String cityname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/city_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
      
  child: Center(child:
       
        SingleChildScrollView(child:
        Column(
         // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
           
        
          Container(
            child: Align(
              alignment: Alignment.topLeft,
              child: FlatButton(
                onPressed: () {
                  Navigator.pop(context,true);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 50.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .10,
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              // decoration: InputDecoration(
              //   filled: true,
              //   fillColor: Colors.white,
              // ),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                cityname = value;
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .10,
          ),
          FlatButton(
            onPressed: () {
              Navigator.pop(context, cityname);
            },
            child: Text(
              'Get Weather',
              style: TextStyle(fontSize: 30),
            ),
          )
        ],
      ),
        )
  )
      )
    );
  }
}
