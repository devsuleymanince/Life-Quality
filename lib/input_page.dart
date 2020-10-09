import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_kalitesi/constans.dart';
import 'package:yasam_kalitesi/result_page.dart';
import 'package:yasam_kalitesi/user_data.dart';

import 'hakkinda.dart';
import 'mywidget_gender_column.dart';
import 'mywidget_mycontainer.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet;
  double icilenSigara = 0.0;
  double yapilanSpor = 0.0;
  int boy = 170;
  int kilo = 75;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("YAŞAM KALİTESİ",style: metinStili,)),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.info_outline,size: 35,color: Colors.black54,),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => (HakkindaApp())));
              }
          )
        ],
      ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment
              .stretch, // bunu yazmazsan container en geniş değilde içeriğe göre boyut ayarlar
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: MyContainer(
                    child: buidRowOutlineButton('BOY',boy,true),
                  )),
                  Expanded(child: MyContainer(
                    child: buidRowOutlineButton('KİLO',kilo,false),
                  )),
                ],
              ),
            ),
            Expanded(
                child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Haftada kaç kere spor yapıyorsun?", style: metinStili),
                  Text(yapilanSpor.round().toString(), style: sayiStili),
                  // icilenSigara double old. için round fonksiyonu ile yuvarlama yaptım
                  Slider(
                    min: 0,
                    max: 7,
                    divisions: 7,
                    value: yapilanSpor,
                    onChanged: (double newValue) {
                      setState(() {
                        yapilanSpor = newValue;
                      });
                    },
                  )
                ],
              ),
            )),
            Expanded(
                child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Günde kaç tane sigara içiyorsun?", style: metinStili),
                  Text(icilenSigara.round().toString(), style: sayiStili),
                  // icilenSigara double old. için round fonksiyonu ile yuvarlama yaptım
                  Slider(
                    min: 0,
                    max: 30,
                    divisions: 30,
                    value: icilenSigara,
                    onChanged: (double newValue) {
                      setState(() {
                        icilenSigara = newValue;
                      });
                    },
                  )
                ],
              ),
            )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: MyContainer(
                          onPress: () {
                            setState(() {
                              seciliCinsiyet = 'KADIN';
                            });
                          },
                          renk: seciliCinsiyet == 'KADIN'
                              ? Colors.grey[300]
                              : Colors.white,
                          child: GenderColumn(
                            cinsiyet: 'KADIN',
                            cinsiyetIkon: FontAwesomeIcons.venus,
                          ))),
                  Expanded(
                      child: MyContainer(
                          onPress: () {
                            setState(() {
                              seciliCinsiyet = 'ERKEK';
                            });
                          },
                          renk: seciliCinsiyet == 'ERKEK'
                              ? Colors.grey[300]
                              : Colors.white,
                          child: GenderColumn(
                            cinsiyet: 'ERKEK',
                            cinsiyetIkon: FontAwesomeIcons.mars,
                          ))),
                ],
              ),
            ),
            ButtonTheme(
              height: 50,
              child: FlatButton(
                color: Colors.yellow[100],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    //side: BorderSide(color: Colors.white)
                ),
                //padding: EdgeInsets.fromLTRB(1,12,1,12),
                textColor: Colors.black54,
                // color: Colors.orangeAccent[400],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Hesapla',style:metinStili,),
                    SizedBox(width: 10,),
                    Icon(
                      FontAwesomeIcons.checkCircle,
                      size: 25.0,
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
                    UserData(seciliCinsiyet: seciliCinsiyet,icilenSigara: icilenSigara,yapilanSpor: yapilanSpor,boy: boy,kilo: kilo)
                  ),
                  ),);
                },
              ),
            ),
            SizedBox(height: 5,),
          ],
        ),
    );
  }

  Row buidRowOutlineButton(String olcumAdi,int olcumBirimi,bool boyAlaniMi) {
    return Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          "$olcumAdi",
                          style: metinStili,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          olcumBirimi.toString(),
                          style: sayiStili,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonTheme(
                            minWidth: 36,
                            child: OutlineButton(
                              borderSide: BorderSide(color: Colors.lightBlue),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                size: 10,
                              ),
                              onPressed: () {
                                setState(() {
                                  if(boyAlaniMi==true){
                                    boy++;
                                  }else{
                                    kilo++;
                                  }
                                });
                              },
                            ),
                          ),
                          ButtonTheme(
                            minWidth: 36,
                            child: OutlineButton(
                              borderSide: BorderSide(color: Colors.lightBlue),
                              child: Icon(
                                FontAwesomeIcons.minus,
                                size: 10,
                              ),
                              onPressed: () {
                                setState(() {
                                  if(boyAlaniMi==true){
                                    boy--;
                                  }else{
                                    kilo--;
                                  }
                                });
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  );
  }
}
