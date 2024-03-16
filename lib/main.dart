import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        ColorFiltered(
          colorFilter: const ColorFilter.mode(
            Color.fromRGBO(0, 0, 0, 0.4),
            BlendMode.darken,
          ),
          child: Image.asset(
            "imagens/restaurante.jpeg",
            fit: BoxFit.fitHeight,
            height: 800.0,
          ),
        ),
        Column(
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: [
                        Image.asset(
                          "imagens/logo_restaurante.png",
                          fit: BoxFit.fitHeight,
                          height: 100,
                        ),
                        const Text(
                          "Los Cráneos Hermanos",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const Text(
                          "Restaurante Mexicano",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$_pessoa",
                          style: GoogleFonts.bangers(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: _tamanho,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      _mensagem,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 25,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.green),
                        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                        ),
                      ),
                      child: const Text(
                        "+",
                        style: TextStyle(fontSize: 70.0, color: Colors.black),
                      ),
                      onPressed: () {
                        _changePeople(1);
                      },
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red),
                        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                      ),
                      child: const Text(
                        "-",
                        style: TextStyle(fontSize: 70.0, color: Colors.black),
                      ),
                      onPressed: () {
                        _changePeople(-1);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
