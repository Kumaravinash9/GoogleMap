

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../FileSystem.dart';
import 'ShowBottomModelSheet.dart';

class map extends StatefulWidget {
 final double lat,lng;
 final String place;
 final ListHostel hostel;
  final  Completer<GoogleMapController> _completer ;
  map(this.lat,this.lng,this._completer,this.place,this.hostel);
  @override
  _mapState createState() => _mapState();
}

class _mapState extends State<map> {
    
   CameraPosition _intial;

     
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
  _intial=CameraPosition(target: LatLng(widget.lat,widget.lng),zoom:15.05);

   
  }
 
 
  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      
      child: GoogleMap(
           zoomControlsEnabled: false,
           mapType: MapType.terrain,
           myLocationEnabled: false,
           rotateGesturesEnabled: true,
           onMapCreated: (GoogleMapController controller)
           {
         widget. _completer.complete(controller) ;
              
           },
           
           initialCameraPosition: _intial,
           markers: Set<Marker>.of([
            Marker(markerId: MarkerId("Home"),position: LatLng(widget.lat,widget.lng),infoWindow: InfoWindow(
             title: widget.place,snippet: "Courstey : Bihar",onTap: (){
               debugPrint("hello");
               showBottom(context,widget.hostel);
               Focus.of(context).unfocus();
             }

            ),icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)
            )
          ]),

      ),
      
    );
  }
}
