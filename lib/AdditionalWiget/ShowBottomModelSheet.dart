




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showBottom(BuildContext ctx ) async{
   List<String>_images=[
    "https://images-na.ssl-images-amazon.com/images/M/MV5BMjEyOTYyMzUxNl5BMl5BanBnXkFtZTcwNTg0MTUzNA@@._V1_SX1500_CR0,0,1500,999_AL_.jpg",
      "https://images-na.ssl-images-amazon.com/images/M/MV5BNzM2MDk3MTcyMV5BMl5BanBnXkFtZTcwNjg0MTUzNA@@._V1_SX1777_CR0,0,1777,999_AL_.jpg",
      "https://images-na.ssl-images-amazon.com/images/M/MV5BMTY2ODQ3NjMyMl5BMl5BanBnXkFtZTcwODg0MTUzNA@@._V1_SX1777_CR0,0,1777,999_AL_.jpg",
      "https://images-na.ssl-images-amazon.com/images/M/MV5BMTMxOTEwNDcxN15BMl5BanBnXkFtZTcwOTg0MTUzNA@@._V1_SX1777_CR0,0,1777,999_AL_.jpg",
      "https://images-na.ssl-images-amazon.com/images/M/MV5BMTYxMDg1Nzk1MV5BMl5BanBnXkFtZTcwMDk0MTUzNA@@._V1_SX1500_CR0,0,1500,999_AL_.jpg"


  ];
await showModalBottomSheet(elevation: 0,backgroundColor: Colors.transparent.withOpacity(0), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),  context: ctx, builder: (btcx){
return
  
 Container(
   margin: const EdgeInsets.all(8),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.teal,border: Border.all(width:1,color:Colors.black)
  ),
  padding: const EdgeInsets.all(8),
  
  height: double.infinity,
  child: Column(
   mainAxisAlignment: MainAxisAlignment.start,
   crossAxisAlignment: CrossAxisAlignment.start,

   children:<Widget> [
    Container(
     height:250,
    margin: EdgeInsets.only(bottom:10),
     child: ListView.separated(itemBuilder: (context,index){
       return Container(
         padding:const EdgeInsets.all(6),
        width:MediaQuery.of(context).size.width*.8,
        
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(_images[index]),fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.circular(10)

       ));
     }, separatorBuilder: (context,index){
       return SizedBox(width: 6);
     }, itemCount: _images.length ,scrollDirection: Axis.horizontal,),

    ),
    Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(width:1,color:Colors.white),
        borderRadius: BorderRadius.circular(8)
      ),
       padding: EdgeInsets.symmetric(vertical:10,horizontal: 6),
  child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",style: TextStyle(
    fontSize: 14,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,color: Colors.white.withOpacity(.9)
  ),),

    ),
    Row(
     mainAxisAlignment: MainAxisAlignment.spaceAround,
     crossAxisAlignment: CrossAxisAlignment.center,
     children: [
     FlatButton(onPressed: (){

     },color: Colors.transparent, child: Container(
        padding: const EdgeInsets.all(9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             
              Card(child: Icon(Icons.phone,size: 30,color: Colors.white,),elevation: 10,color: Colors.transparent,shadowColor: Colors.transparent,),
             SizedBox(height:5),
            Text("Call",style: TextStyle(
              fontSize: 14,fontWeight: FontWeight.w800,color: Colors.white
            ),)
          ],
        ),
     )),

     FlatButton(onPressed: (){

     },color: Colors.transparent, child: Container(
        padding: const EdgeInsets.all(9),
        color:Colors.redAccent,
        child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Icon(Icons.attach_money,color:Colors.white),
             SizedBox(width: 3,),
             Text("500"+"-"+"200"),
           ],
        )
     )),
     FlatButton(onPressed: (){

     },color: Colors.transparent, child: Container(
        padding: const EdgeInsets.all(9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             
             CircleAvatar(child: Card(child: Icon(Icons.info,size: 30,color: Colors.white,),elevation: 10,color: Colors.transparent,shadowColor: Colors.transparent),backgroundColor: Colors.transparent,radius: 25,),
             SizedBox(height:5),
            Text("More Info",style: TextStyle(
              fontSize: 14,fontWeight: FontWeight.w800,color: Colors.white
            ),)
          ],
        ),
     )),

     ],
    )

   ],



  ),
  
  
 );
});
}