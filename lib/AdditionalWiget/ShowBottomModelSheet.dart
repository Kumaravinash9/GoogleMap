






import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../FileSystem.dart';

showBottom(BuildContext ctx ,ListHostel hostel) async {
 
  await showModalBottomSheet(elevation: 0,backgroundColor: Colors.yellow.withOpacity(0), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),  context: ctx, builder: (btcx){
return
  
 Container(
     margin: const EdgeInsets.all(6),
    
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,border: Border.all(width:1,color:Colors.black)
    ),
    padding: const EdgeInsets.all(8),
    
    child:  Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,

       children:<Widget> [

         Expanded(
                    child: Container(
            
              margin: EdgeInsets.only(bottom:10),
              child: ListView.separated(itemBuilder: (context,index){
               return Container(
                 padding:const EdgeInsets.all(6),
                width:MediaQuery.of(context).size.width*.8, 
                height: 350,      
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(hostel.photos[index]),fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(10)

               ));
             }, separatorBuilder: (context,index){
               return SizedBox(width: 6);
             }, itemCount: hostel.photos.length ,scrollDirection: Axis.horizontal,),

            ),
         ),
       



//Text Part


   Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(width:1,color:Colors.black),
              borderRadius: BorderRadius.circular(8)
            ),
             padding: EdgeInsets.symmetric(vertical:10,horizontal: 6),
            child: Text(hostel.address.substring(60),style: TextStyle(
            fontSize: MediaQuery.of(ctx).size.width*.032,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,color: Colors.black.withOpacity(.9)
             ),softWrap:true,overflow: TextOverflow.fade,
      ),

          ),
       

   Container(
       
       width: double.infinity,
       child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisSize: MainAxisSize.max,
             children: [
             FlatButton(onPressed: (){
               debugPrint("Hello");
             },color: Colors.transparent, child: Container(
                padding: const EdgeInsets.all(9),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     
                      Card(child: Icon(Icons.phone,size: MediaQuery.of(ctx).size.width*.07,color: Colors.blue,),elevation: 10,color: Colors.transparent,shadowColor: Colors.transparent,),
                     SizedBox(height:MediaQuery.of(ctx).size.width*.002),
                    Text("Call",style: TextStyle(
                      fontSize: MediaQuery.of(ctx).size.width*.026,fontWeight: FontWeight.w800,color: Colors.black
                    ),)
                  ],
                ),
             )),

             FlatButton(onPressed: (){

             },color: Colors.transparent, child: Container(
                padding: const EdgeInsets.all(8),
                color:Colors.transparent,
                child: Expanded(
                            child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Icon(Icons.attach_money,color:Colors.redAccent),
                       SizedBox(width: MediaQuery.of(ctx).size.width*.026,),
                       Text(hostel.start_price.toString()+"-"+hostel.end_price.toString()),
                     ],
                  ),
                )
             )),
             FlatButton(onPressed: (){

             },color: Colors.transparent, child: Container(
                padding: const EdgeInsets.all(9),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
            
                    Icon(Icons.info,size: MediaQuery.of(ctx).size.width*.07,color: Colors.red,),
                     SizedBox(height:5),
                    Text("More Info",style: TextStyle(
                      fontSize: MediaQuery.of(ctx).size.width*.026,fontWeight: FontWeight.w800,color: Colors.black
                    ),)
                  ],
                ),
             )),],
             ),
   ),
       ],
      ),
  
  
 );
});
}