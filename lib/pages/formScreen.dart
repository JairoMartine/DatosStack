import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MyStateFulWidget extends StatefulWidget {
 const MyStateFulWidget({Key? key}) : super(key: key);

  @override
  State<MyStateFulWidget> createState() => _MyStateFulWidgetState();
}

class _MyStateFulWidgetState extends State<MyStateFulWidget> {
  late TextEditingController _controller;

  bool _isChecked = false;
  
  var maskFormatter = MaskTextInputFormatter(mask: '####-####-####-####', filter: { "#": RegExp(r'[0-9]') });

  @override
  void initState() {
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
        
        child: Form(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
             inputEmail(_controller),
             const SizedBox(height: 10),
             inputPassword(),
             const SizedBox(height: 10),
             inputCard(maskFormatter),
             const SizedBox(height: 10),
             Container(
               
               padding: const EdgeInsets.symmetric(horizontal: 20.0), //interno
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
               child: CheckboxListTile(
                 
                 title: const Text('Validar'),
                 
                 value: _isChecked,
                onChanged: (bool? value) {
                      setState(() { //cambia el estado de la viriable
                        _isChecked = value!;
                      });
                     },
                ),
             ),

            

             /*CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Primero'),
                  value: _isChecked, 
                  onChanged: (bool? value) {
                    setState(() { //cambia el estado de la viriable
                      _isChecked = value!;
                    });
                   },
              
             ),*/
             const SizedBox(height: 10),
             ElevatedButton(
               
               onPressed: ()=>{},
               child: const Text('Enviar'))
            ], 
          ),
        ),
      ),
    );
  }
}



Widget inputCard(maskFormatter) {
  return  Container(
    padding: const EdgeInsets.symmetric(horizontal: 20.0), //interno
   margin: const EdgeInsets.symmetric(horizontal: 30.0), //externo
   decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: Colors.blue, width: 3.0)
    ),
    child: TextField(
                   keyboardType: TextInputType.number, //numeros en el teclado
                   inputFormatters: [
                     /*FilteringTextInputFormatter.allow(
                       RegExp('[0-9 -]')
                     ),
                     LengthLimitingTextInputFormatter(16)*/
                     maskFormatter
                   ], //reglas
                   decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.credit_card),
                    labelText: 'Tarjeta',
                    hintText: '1234-1234-1234-1234'
                   ),
                ),
  );
}

Widget inputPassword() {
  return  Container(
    padding: const EdgeInsets.symmetric(horizontal: 20.0), //interno
  margin: const EdgeInsets.symmetric(horizontal: 30.0), //externo
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: Colors.blue, width: 3.0)
    ),
    child: TextFormField(
                  //controller: _controller,
                  obscureText: true,
                   decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Contraseña',
                   ),
                ),
  );
}


//METODO PARA EL FORMULARIO
Widget inputEmail(_controller){
  return Container( //permite agregar unas decoraciones
  padding: const EdgeInsets.symmetric(horizontal: 20.0), //interno
  margin: const EdgeInsets.symmetric(horizontal: 30.0), //externo
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: Colors.blue, width: 3.0)
    ),

    child: TextFormField(
       keyboardType: TextInputType.emailAddress,
       autofocus: true,
       controller: _controller,
        decoration: const InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(Icons.contact_mail),
        labelText: 'Correo',
        hintText: 'micorreo@correo.com'
        ),

      ),
  );
}

/*

TextFormField(
                keyboardType: TextInputType.emailAddress,
                autofocus: true,
                controller: _controller,
                decoration: const InputDecoration(
                  //icon: Icon(Icons.contact_mail),
                  prefixIcon: Icon(Icons.contact_mail),
                  labelText: 'Correo',
                  hintText: 'micorreo@correo.com'
                 ),

              ),
              const SizedBox(height: 20.0),
              const TextField(
                //controller: _controller,
                obscureText: true,
                 decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Contraseña',
                 ),
              ),
              const SizedBox(height: 20.0),
               TextField(
                 keyboardType: TextInputType.number, //numeros en el teclado
                 inputFormatters: [
                   FilteringTextInputFormatter.allow(
                     RegExp('[0-9 -]')
                   ),
                   LengthLimitingTextInputFormatter(16)
                 ], //reglas
                 decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.credit_card),
                  labelText: 'Tarjeta',
                  hintText: '1234-1234-1234-1234'
                 ),
              ),
              const SizedBox(height: 20.0),
              
              CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('Primero'),
                  value: _isChecked, 
                  onChanged: (bool? value) {
                    setState(() { //cambia el estado de la viriable
                      _isChecked = value!;
                    });
                   },

                ),
              const SizedBox(height: 10.0),
              CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('Segundo'),
                  value: _isChecked, 
                  onChanged: (bool? value) {
                    setState(() { //cambia el estado de la viriable
                      _isChecked = value!;
                    });
                   },

                ),
              const SizedBox(height: 10.0),
              CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('Tercero'),
                  value: _isChecked, 
                  onChanged: (bool? value) {
                    setState(() { //cambia el estado de la viriable
                      _isChecked = value!;
                    });
                   },

                )    

*/
/*
 onSubmitted: (String value ) async {
              await showDialog<void>(
                    context: context, 
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: const Text('Prueba diálogo'),
                        content: Text('Ha escrito "$value", de longitud: ${value.characters.length}'),
                        actions:<Widget> [
                          TextButton(
                            onPressed: () =>Navigator.pop(context), 
                            child: const Text('OK'))
                        ],
                      );
                    }
                    
              );
            },




*/