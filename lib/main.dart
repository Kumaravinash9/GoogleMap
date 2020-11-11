import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
        
      });
   }

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children:<Widget> [
          map(lat,lng,_completer,place),
        textField(_geocoder),


        ],

      ),
      
    );
  }
}

class textField extends StatefulWidget {
 void  Function (String  _text)_geocoder;
  textField(this._geocoder);
  @override
  _textFieldState createState() => _textFieldState();
}

class _textFieldState extends State<textField> {
 TextEditingController _text= new TextEditingController() ;
 
  @override
  Widget build(BuildContext context) {
    return Container(
      width:300,
          child: Padding(
        padding: const EdgeInsets.only(top:40),
        child: TextField(
            decoration: InputDecoration(border: OutlineInputBorder(gapPadding:  2,borderSide: BorderSide.none),suffixIcon: Icon(Icons.search),contentPadding: const EdgeInsets.symmetric(vertical: 1,horizontal: 5),filled: true,fillColor: Colors.blue[50]),
            onSubmitted: (value){
              setState(() {
               
              widget._geocoder(_text.text.toString());
             });
             _text.clear();
             Focus.of(context).unfocus();
             
            },
            controller: _text,
        ),
        
      ),
    );
  }
}
class map extends StatefulWidget {
 final double lat,lng;
 final String place;
 Completer<GoogleMapController> completer;
  map(this.lat,this.lng,this.completer,this.place);
  @override
  _mapState createState() => _mapState();
}

class _mapState extends State<map> {
    GoogleMapController _controller;
   CameraPosition _intial;
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
  _intial=CameraPosition(target: LatLng(widget.lat,widget.lng));
   
  }
  
 
  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
       
           
           zoomControlsEnabled: false,
           myLocationEnabled: false,
           rotateGesturesEnabled: true,
           onMapCreated: (GoogleMapController controller)
           {
             widget.completer.complete(controller) ;
              
           },
           
           initialCameraPosition: _intial,
           markers: Set<Marker>.of([
            Marker(markerId: MarkerId("Home"),position: LatLng(widget.lat,widget.lng),infoWindow: InfoWindow(
             title: widget.place,snippet: "Courstey : Bihar",onTap: (){
               showBottom(context);
               Focus.of(context).unfocus();
             }

            )
            )
          ]),

      ),
      
    );
  }
}
showBottom(BuildContext ctx) async{
await showModalBottomSheet(context: ctx, builder: (btcx){
return Card(
  child:Container(
  height:300,

  
  ),
);
});
}
