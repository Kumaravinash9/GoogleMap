import 'dart:async';

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'AdditionalWiget/Map.dart';
import 'AdditionalWiget/TextField.dart';
import './FileSystem.dart';
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
      home: _listView(),
    );
  }
}

class GoogleApp extends StatefulWidget {
  final ListHostel hostel;
   GoogleApp(this.hostel);
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
    
    place=widget.hostel.address;
    
  }
  Completer<GoogleMapController> _completer = Completer();
  Marker _marker;
 Future<void> animateTo(double lat, double lng) async {
    
    final c = await _completer.future;
    final p = CameraPosition(target: LatLng(lat, lng), zoom: 14.4746);
    c.animateCamera(CameraUpdate.newCameraPosition(p));
    
}
  



 
 Future< Object> _geocoder(String query) async{    
      var addresses = await Geocoder.local.findAddressesFromQuery(query);
      var first = addresses.first;
      print("${first.featureName} aa${first.coordinates.latitude}");
      
      return first;
   }
Future< void> _geocoderMap(String query) async{
   var addresses = await Geocoder.local.findAddressesFromQuery(query);
      var first = addresses.first;
    setState(() {
          place=query;
          animateTo(first.coordinates.latitude,first.coordinates.longitude);
                  });
   }

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder(
        future:_geocoder(widget.hostel.city),
      builder: (ctx,snapshot){
        if(!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
          else{
           
          return Stack(
         

        children:<Widget> [
          map(snapshot.data.coordinates.latitude,snapshot.data.coordinates.longitude,_completer,place,widget.hostel),
        textField(_geocoderMap),


        ],

      );
          }
      }
    ));
  }
}






class _listView extends StatefulWidget {
  @override
  __listViewState createState() => __listViewState();
}

class __listViewState extends State<_listView> {
   List<ListHostel>hostelinfo=ListHostel.getMore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("HostelKhojo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(itemCount: hostelinfo.length, itemBuilder: (BuildContext context,int index){
  return stacy(hostelinfo[index], context);

}),
      ),
      
    );
  }
}


Widget stacy(ListHostel hostel,BuildContext context){
   
  return  Card(
    elevation: 10,
      child: Container(
    width: MediaQuery.of(context).size.width*.6,
    margin: const EdgeInsets.all(8),
    padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 0),
    decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(10)
    ),
    child: Expanded(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Image.network(hostel.photos[0],width:MediaQuery.of(context).size.width*.4,fit: BoxFit.cover,filterQuality: FilterQuality.medium,),
         SizedBox(width:5),
         Expanded(
                    child: Column(
             children: [ 
                      Container( 
                          margin: const EdgeInsets.only(bottom: 1),
                        child:Text(hostel.address.substring(75),style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width*.03,
                        ),textAlign: TextAlign.start,) ,
                        width:MediaQuery.of(context).size.width*.5 , 
                        
                  ),
                  
                 Row(
                       mainAxisSize: MainAxisSize.min,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                           Container(
                               child: 
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                             children: <Widget>[
                             Icon(Icons.attach_money,size: MediaQuery.of(context).size.width*.04 ,color: Colors.red,),
                             Text(hostel.start_price.toString()+"-"+hostel.end_price.toString(),style: TextStyle(
                                 fontSize: MediaQuery.of(context).size.width*.030
                             ),softWrap: true,overflow: TextOverflow.fade,
                             )]
                             ),
                           ),
                      
                       
                          SizedBox(width:MediaQuery.of(context).size.width*.11)   ,       
                    
                          IconButton(icon: Icon(Icons.maps_ugc,size: MediaQuery.of(context).size.width*.055), onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                                   return GoogleApp (
                                    hostel );}));
                          })
                      ],
                      ),
                            
                              SizedBox(child: Text(
                              "Verified",softWrap: true,overflow: TextOverflow.fade, textAlign: TextAlign.end,),width: double.infinity, )                      

             ],),
         ),
          
        
        
        
        
        ],

      ),
    ),


    ),
  );



}