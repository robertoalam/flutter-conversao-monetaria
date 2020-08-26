import 'package:flutter/material.dart';

class Conversao extends StatefulWidget {
  @override
  _ConversaoState createState() => _ConversaoState();
}

class _ConversaoState extends State<Conversao> {
  final TextEditingController _valorReal = TextEditingController();
  final TextEditingController _valorDolar = TextEditingController();
  String _resposta = "";

  // snackbar
  final key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text("Conversao Monetaria"),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Image.asset("images/cifrao.png" , width: 90,),
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    controller: _valorReal,
                    decoration: InputDecoration(
                        hintText: "Insiria o valor em Reais" ,
                        border:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: _valorDolar,
                  decoration: InputDecoration(
                      hintText: "Insiria a cotação do DOLLAR" ,
                      border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(_resposta,style: TextStyle(color: Colors.blue , fontSize: 20),),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        onTap: _clickBotao,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.clear,color: Colors.white,),
              title: Text("Limpar", style: TextStyle(color:Colors.white),)
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.star,color: Colors.white,),
              title: Text("Calcular", style: TextStyle(color:Colors.white),)
          ),
        ],
      ),
    );
  }

  _clickBotao(int index){

    // se for zero == limpar
    if(index == 0){
      _valorReal.clear();
      _valorDolar.clear();
    }else{
      if( _valorReal.text.isEmpty || _valorDolar.text.isEmpty ){
        key.currentState.showSnackBar(SnackBar(
            content: Text("Altura e Peso obrigatorios"))
        );
      }else{
        var valorReal = double.parse(_valorReal.text);
        var valorDolar = double.parse(_valorDolar.text);
        var calculo = (valorReal / valorDolar).toStringAsFixed(2) ;
        debugPrint(calculo.toString());
        setState(() {
          _resposta = "Com ${valorReal} é possível comprar ${calculo} dólares a ${valorDolar} cada";
        });
      }
    }
  }

}
