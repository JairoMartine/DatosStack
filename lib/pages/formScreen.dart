import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyStateFulWidget extends StatefulWidget {
  MyStateFulWidget({Key? key}) : super(key: key);

  @override
  State<MyStateFulWidget> createState() => _MyStateFulWidget();
}

class _MyStateFulWidget extends State<MyStateFulWidget> {
  late TextEditingController _controller;

  bool _isChecked = false;
  bool _isChecked1 = false;
  bool _isChecked2 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.emailAddress,
              autofocus: true,
              controller: _controller,
              decoration: const InputDecoration(
                //icon: Icon(Icons.contact_mail),
                prefixIcon: Icon(Icons.contact_mail),
                labelText: 'Correo',
                hintText: 'prueba@gmail.com'
            ),
          ),
          const SizedBox(height: 20.0),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              //icon: Icon(Icons.contact_mail),
              prefixIcon: Icon(Icons.lock),
              labelText: 'Contraseña',
              //hintText: 'prueba@gmail.com'
            ),
          ),
          const SizedBox(height: 20.0),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9 -]')),
              LengthLimitingTextInputFormatter(19)
            ],
            decoration: InputDecoration(
            prefixIcon: Icon(Icons.credit_card),
            labelText: 'Tarjeta',
            hintText: '1234-1234-1234-1234'
            ),
          ),
              const SizedBox(height: 10.0),
              Text('Seleccione el tipo de tarjeta'),
              CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('VISA'),
                  value: _isChecked, 
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value!;
                    });
                   },

                ),
              const SizedBox(height: 10.0),
              CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('MASTERCARD'),
                  value: _isChecked1, 
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked1 = value!;
                    });
                   },

                ),
              const SizedBox(height: 10.0),
              CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('AMERICAN EXPRESS'),
                  value: _isChecked2, 
                  onChanged: (bool? value) {
                    setState(() { //cambia el estado de la viriable
                      _isChecked2 = value!;
                    });
                   },
          )
        ]
        ),
      ),
    )
    );
  }
}

/*
onSubmitted: (String value) async{
              await showDialog<void>(
                  context: context, 
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: const Text('Prueba dialogo'),
                      content: Text('Ha escrito "$value", de longitud: ${value.characters.length}'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context), 
                          child: Text('Ok'),
                          )
                      ],
                  );
                }    
              );
            },
*/