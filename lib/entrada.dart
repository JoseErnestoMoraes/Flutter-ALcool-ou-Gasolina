import 'package:flutter/material.dart';

class entrada extends StatefulWidget {
  const entrada({Key? key}) : super(key: key);

  @override
  _entradaState createState() => _entradaState();
}

class _entradaState extends State<entrada> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(30),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Digite um valor"),

              //captura em tempo real
              /*onChanged: (String e) {
                print("valor digitado: " + e);
              },*/

              //captura apenas no enter
              onSubmitted: (String texto) {
                print("valor digitado: " + texto);
              },

              controller: _textEditingController,
            ),
          ),
          ElevatedButton(
            child: Text("Salvar"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightGreen)),
            onPressed: () {
              print("valor digitado: " + _textEditingController.text);
            },
          )
        ],
      ),
    );
  }
}
