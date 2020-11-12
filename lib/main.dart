import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'AdditionalWiget/Map.dart';

import 'AdditionalWiget/TextField.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: GoogleApp(),
    );
  }
}

class GoogleApp extends StatefulWidget {
  @override
  _GoogleAppState createState() => _GoogleAppState();
}

class _GoogleAppState extends State<GoogleApp> {
   double lat,lng;
   String place;
   
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lat=40.712;
    lng=-74.00;
    place="new York";

  }
  Completer<GoogleMapController> _completer = Completer();


   Future<void> animateTo(double lat, double lng) async {
    final c = await _completer.future;
    final p = CameraPosition(target: LatLng(lat, lng), zoom: 14.4746);
    c.animateCamera(CameraUpdate.newCameraPosition(p));
}
 
 Future< void> _geocoder(String query) async{

      var addresses = await Geocoder.local.findAddressesFromQuery(query);
      var first = addresses.first;
      print("${first.featureName} : ${first.coordinates}");
      setState(() {
        lat=first.coordinates.latitude;
        lng=first.coordinates.longitude;
        place=first.featureName;
         animateTo(lat, lng);
        debugPrint(lat.toString());
      });
   }

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        
        children:<Widget> [
          map(lat,lng,_completer,place),
        textField(_geocoder),


        ],

      ),
      
    );
  }
}



