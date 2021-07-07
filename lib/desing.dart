import 'package:flutter/material.dart';

class Desing extends StatefulWidget {
  const Desing({Key? key}) : super(key: key);

  @override
  _DesingState createState() => _DesingState();
}

class _DesingState extends State<Desing> {
  TextEditingController _textEditingAlcool = TextEditingController();
  TextEditingController _textEditingGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    print("Precionado!");
    double? precoAlcool = double.tryParse(_textEditingAlcool.text);
    double? precoGasolina = double.tryParse(_textEditingGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
            "Número inválido, digite números maiores que 0 e utilizando (.)";
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";
        });
      } else {
        setState(() {
          _textoResultado = "Melhor abastecer com alcool";
        });
      }
    }
  }

  void limparCampos() {
    _textEditingGasolina.text = "";
    _textEditingAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
      ),
      body: Container(
          child: SingleChildScrollView(
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //image
                  Image.asset("images/logo.png"),

                  //legenda
                  Padding(
                    padding: EdgeInsets.only(top: 25, bottom: 25),
                    child: Text(
                      "Saiba qual a melhor opção para abastecimento do seu carro",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),

                  //Box
                  TextField(
                    controller: _textEditingAlcool,
                    style: TextStyle(fontSize: 22),
                    keyboardType: TextInputType.text,
                    decoration:
                        InputDecoration(labelText: "Preço Álcool, ex: 1.96"),
                  ),

                  //Box
                  TextField(
                    controller: _textEditingGasolina,
                    style: TextStyle(fontSize: 22),
                    keyboardType: TextInputType.text,
                    decoration:
                        InputDecoration(labelText: "Preço Gasolina, ex: 3.15"),
                  ),

                  //Botao
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                        onPressed: _calcular,
                        child: Container(
                          child: Text(
                            "Calcular",
                            style: TextStyle(fontSize: 20),
                          ),
                          padding: EdgeInsets.all(15),
                        )),
                  ),

                  //BOtão
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.pinkAccent)),
                        onPressed: () {
                          setState(() {
                            print("Limpar!");
                            _textoResultado = "";
                            limparCampos();
                          });
                        },
                        child: Container(
                          child: Text(
                            "Limpar",
                            style: TextStyle(fontSize: 20),
                          ),
                          padding: EdgeInsets.all(15),
                        )),
                  ),

                  //Legenda
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      _textoResultado,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ))),
    );
  }
}
