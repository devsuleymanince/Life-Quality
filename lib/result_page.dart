import 'package:flutter/material.dart';
import 'package:yasam_kalitesi/constans.dart';
import 'package:yasam_kalitesi/user_data.dart';

class ResultPage extends StatelessWidget {

  // UserData classındaki bilgileri bu sayfaya çekebilmek için
  final UserData _userData;
  ResultPage(this._userData);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonucunuz:"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Center(child: Text("Tahmini Yaşam Yılınız: " +sonucHesapla().round().toString(),style: metinStili,)),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("GERİ DÖN",style: metinStili,),
            ),
          )
        ],
      ),
    );
  }

  double sonucHesapla(){
    /*
    Bu hesaplama hiçbir bilimsel veriye dayalı değildir.
    Bu uygulama tamamen deneme amaçlıdır
     */

    double sonuc;
    sonuc = 90 + _userData.yapilanSpor - _userData.icilenSigara;
    sonuc = sonuc + (_userData.boy/_userData.kilo);

    if(_userData.seciliCinsiyet == 'KADIN'){
      return sonuc+3;
    }
    else{
      return sonuc;
    }
  }
}
