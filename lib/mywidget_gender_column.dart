import 'package:flutter/material.dart';

class GenderColumn extends StatelessWidget {
  final String cinsiyet;
  final IconData cinsiyetIkon;

  GenderColumn({this.cinsiyet,this.cinsiyetIkon});


  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment:MainAxisAlignment.center,
      children: [
        Icon(cinsiyetIkon,size: 50,color: Colors.black54,),
        SizedBox(height: 10,),
        Text(cinsiyet,style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold),)
      ],
    );
  }
}