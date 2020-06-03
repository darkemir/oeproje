import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'soruislemleri.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

enum CevapSecenegi { dogru, yanlis }
SorularIslemler sorularveIslemler = SorularIslemler();

void main() {
  runApp(Quizend());
}

class Quizend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: QuizSayfasi(),
    );
  }
}

class QuizSayfasi extends StatefulWidget {
  @override
  _QuizSayfasiState createState() => _QuizSayfasiState();
}

class _QuizSayfasiState extends State<QuizSayfasi> {
  List<Icon> tikvecarpilar = [];
  void cevabiKontrolet(CevapSecenegi kullaniciCevabi) {
    CevapSecenegi dogruCevap = sorularveIslemler.dogruCevabial();

    setState(() {
      if (sorularveIslemler.bittiMi()) {
        Alert(
          context: context,
          title: "Bitti!",
          desc: "Quiz Sonu!.",
          buttons: [
            DialogButton(
              child: Text(
                "Yeniden Gir",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                  tikvecarpilar = [];
                  sorularveIslemler.reset();
                });
              },
              width: 120,
            )
          ],
        ).show();
      } else {
        if (kullaniciCevabi == dogruCevap) {
          tikvecarpilar.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          tikvecarpilar.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        sorularveIslemler.sonrakiSoru();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'END101 QUIZ',
      )),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/etulogo.png'),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(45.0, 135.0, 45.0, 45.0),
                    child: Container(
                      color: Color(0xBD3AA3E9),
                      child: Center(
                        child: Text(sorularveIslemler.soruyuGoster(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                            )),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: FlatButton(
                      onPressed: () {
                        cevabiKontrolet(CevapSecenegi.dogru);
                      },
                      color: Colors.blue,
                      child: Text(
                        'Doğru',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: FlatButton(
                      onPressed: () {
                        cevabiKontrolet(CevapSecenegi.yanlis);
                      },
                      color: Colors.blue,
                      child: Text(
                        'Yanlış',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: tikvecarpilar,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
