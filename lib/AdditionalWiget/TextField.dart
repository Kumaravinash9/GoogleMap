

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class textField extends StatefulWidget {
final   Function (String  _text)_geocoder;
  textField(this._geocoder);
  @override
  _textFieldState createState() => _textFieldState();
}

class _textFieldState extends State<textField> {
 TextEditingController _text= new TextEditingController() ;
 
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height*.12,
      left:MediaQuery.of(context).size.width*.12,
          child: Container(
            
        width:MediaQuery.of(context).size.width*.8,
        height: 100,
      
          
          child: TextField(
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
              decoration: InputDecoration(border: OutlineInputBorder(gapPadding:  2,borderSide: BorderSide(width: 1,color: Colors.black12)),suffixIcon: Icon(Icons.search,size: 20,),contentPadding: const EdgeInsets.symmetric(vertical: 1,horizontal: 10),filled: true,fillColor: Colors.white,hintText: "Search",
              ),
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