import 'package:flutter/material.dart';


void main(){
  runApp(HakkindaApp()

  );
}

class  HakkindaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 51, 102, 1),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: (){
                Navigator.pop(context);
              }
          ),
          title: Text('Geliştirici Hakkında',),
          centerTitle: true,
        ),
        backgroundColor: Color.fromRGBO(64, 114, 148, 1),
        body: SafeArea( // SafeArea çentikli vb. telefonlarda yazıyı çentik kısmına getirmiyor
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50,),
                  CircleAvatar(
                    radius: 100.0,
                    backgroundImage: AssetImage('assets/hakkindafoto.jpg'),
                  ),
                  Text("Süleyman İnce",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white
                    ),
                  ),
                  Container(
                      width: 300,
                      child: Divider(height: 50,color: Colors.white,)),
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    color: Color.fromRGBO(0, 51, 102, 1),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: ListTile(
                        leading: Icon(Icons.email,size: 40,color: Colors.red,),
                        title: Text("dev.suleymanince@gmail.com",style: TextStyle(fontSize: 19.0,color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    color: Color.fromRGBO(0, 51, 102, 1),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: ListTile(
                        leading: Icon(Icons.person,size: 40,color: Colors.blue,),
                        title: Text("instagram/suleymaninception",style: TextStyle(fontSize: 19.0,color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}
