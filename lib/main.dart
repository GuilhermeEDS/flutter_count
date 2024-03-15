import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MaterialApp(title: "Contador de pessoas", home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _pessoa = 0;
  String _mensagem = "Pode entrar!";
  double _tamanho = 60.0;

  void _changePeople(int delta) {
    setState(() {
      _pessoa += delta;
      if (_pessoa >= 20) {
        _mensagem = "Lotado! Não pode entrar.";
        _pessoa = 20;
        _tamanho = 60 + _pessoa * 3;
      } else if (_pessoa >= 0) {
        _mensagem = "Pode Entrar!";
        _tamanho = 60 + _pessoa * 3;
      } else {
        _pessoa = 0;
        _tamanho = 60 + _pessoa * 3;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("imagens/restaurante.jpeg",
            fit: BoxFit.cover, height: 1000.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("imagens/logo_restaurante.png",
                    fit: BoxFit.cover, height: 100),
                const Text("Restaurante Mexicano",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        decoration: TextDecoration.none)),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("$_pessoa",
                        style: GoogleFonts.bangers(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: _tamanho,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none)))
                  ],
                ))
              ],
            )),
            Center(
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      _mensagem,
                      style: const TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 25,
                        decoration: TextDecoration.none,
                      ),
                    ))),
            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                        child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green),
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero))),
                      child: const Text(
                        "+",
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        _changePeople(1);
                      },
                    )),
                    Expanded(
                        child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.red),
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero))),
                      child: const Text(
                        "-",
                        style: TextStyle(fontSize: 40.0, color: Colors.black),
                      ),
                      onPressed: () {
                        _changePeople(-1);
                      },
                    )),
                  ]),
            )
          ],
        )
      ],
    );
  }
}
