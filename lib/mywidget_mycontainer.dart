

import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Color renk;
  final Widget child;
  final Function onPress;

  MyContainer({this.renk = Colors.white,this.child,this.onPress}); // default renk beyaz

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(12.0),
        /*width: 150, Böyle sabit değerli ölçü vermek iyi değildir. (ekranı farklı olan cihazlar)
        height: 150,*/ // Expanded widget'ini kullanmak daha sağlıklı
        decoration: BoxDecoration(
          color: renk,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}