import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(title: "Contador de pessoas", home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoa = 0;
  String _mensagem = "Pode entrar!";

  void _changePeople(int delta) {
    setState(() {
      _pessoa += delta;
      if (_pessoa >= 20) {
        _mensagem = "Lotado, não pode entrar.";
        _pessoa = 20;
      } else if (_pessoa >= 0) {
        _mensagem = "Pode Entrar!";
      } else {
        _pessoa = 0;
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas: $_pessoa",
                style: const TextStyle(
                    color: Colors.greenAccent, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: const Text(
                      "+1",
                      style:
                          TextStyle(fontSize: 40.0, color: Colors.greenAccent),
                    ),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    child: const Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.greenAccent),
                    ),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(
              _mensagem,
              style:  const TextStyle(
                  color: Colors.greenAccent,
                  fontStyle: FontStyle.italic,
                  fontSize: 30),
            )
          ],
        )
      ],
    );
  }
}
