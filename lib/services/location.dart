import 'package:geolocator/geolocator.dart';

class Location{

double lititude;
double longitude;


  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getLastKnownPosition(desiredAccuracy: LocationAccuracy.high);
    
      lititude =position.latitude;
      longitude =position.longitude;
    } catch (e) {
     print(e);
      
    }
  }

}