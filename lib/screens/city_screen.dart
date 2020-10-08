// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:clima/utilities/constants.dart';

// class CityScreen extends StatefulWidget {
//   @override
//   _CityScreenState createState() => _CityScreenState();
// }

// class _CityScreenState extends State<CityScreen> {
//   String cityname;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('images/city_background.jpg'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         //  constraints: BoxConstraints.expand(),

//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: FlatButton(
//                   onPressed: () {
//                     Navigator.pop(context, true);
//                     print('hasna');
//                   },
//                   child: Icon(
//                     Icons.arrow_back_ios,
//                     size: 50.0,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * .05,
//               ),
//               Container(
//                 padding: EdgeInsets.all(20.0),
//                 child: TextField(
//                   style: TextStyle(color: Colors.black),
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                   ),
//                   keyboardType: TextInputType.text,
//                   onChanged: (value) {
//                     cityname = value;
//                   },
//                 ),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * .10,
//               ),
//               FlatButton(
//                 onPressed: () {
//                   Navigator.pop(context, cityname);
//                 },
//                 child: Text(
//                   'Get Weather',
//                   style: TextStyle(fontSize: 30),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
