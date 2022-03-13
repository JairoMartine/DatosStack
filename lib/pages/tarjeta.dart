import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MyStateFulWidget2 extends StatefulWidget {
 const MyStateFulWidget2({Key? key}) : super(key: key);
  @override
  State<MyStateFulWidget2> createState() => _MyStateFulWidgetState2();
}

class _MyStateFulWidgetState2 extends State<MyStateFulWidget2> {
  late TextEditingController _controller; 
  var maskFormatter = MaskTextInputFormatter(mask: '####-####-####-####', filter: { "#": RegExp(r'[0-9]') });
  var maskDate = MaskTextInputFormatter(mask: '##/##');

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
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
               Container(
                width: 400,
                //height: 500,
                child: Image.asset('assets/image/tarjeta.jpg',
                      height: 200,
                      ),
              ),
              inputNombre(_controller),
              const SizedBox(height: 10),
              inputCard(maskFormatter),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  inputDate(),
                 const SizedBox(width: 5.0),
                 inputDvv()

                ],
              ),
            const SizedBox(height: 10),
             ElevatedButton(
               onPressed: ()=>{},
               child: const Text('Pagar'))
            ], 
          ),
        ),
      ),
    );
  }
}

Widget inputNombre(_controller){
  return Container(
  padding: const EdgeInsets.symmetric(horizontal: 20.0),
  margin: const EdgeInsets.symmetric(horizontal: 30.0),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: Colors.blue, width: 3.0)
    ),

    child: TextFormField(
       
       autofocus: true,
       controller: _controller,
        decoration: const InputDecoration(
        border: InputBorder.none,
        
        labelText: 'Nombre',
        hintText: 'Nombre Completo'
        ),

      ),
  );
}

Widget inputCard(maskFormatter) {
  return  Container(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
   margin: const EdgeInsets.symmetric(horizontal: 30.0),
   decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: Colors.blue, width: 3.0)
    ),
    child: TextField(
                   keyboardType: TextInputType.number,
                   inputFormatters: [
                     /*FilteringTextInputFormatter.allow(
                       RegExp('[0-9 -]')
                     ),
                     LengthLimitingTextInputFormatter(16)*/
                     maskFormatter
                   ],
                   decoration: const InputDecoration(
                    //prefixIcon: Icon(Icons.credit_card),
                    labelText: 'Tarjeta',
                    hintText: '1234-1234-1234-1234'
                   ),
                ),
  );
}
Widget inputDvv(){
 return  Container(
   padding: const EdgeInsets.symmetric(horizontal: 20.0),
   margin: const EdgeInsets.symmetric(horizontal: 30.0),
    width: 130.0,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: Colors.blue, width: 3.0)
    ),
    child: TextField(
                   keyboardType: TextInputType.number,
                   inputFormatters: [
                     MaskTextInputFormatter(mask: "###"),
                   ], 
                   decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'CVV',
                    hintText: '111'
                   ),
                ),
 );
}
Widget inputDate(){
 return  Container(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
   margin: const EdgeInsets.symmetric(horizontal: 30.0),
    width: 150.0,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: Colors.blue, width: 3.0)
    ),
    child: TextField(
                   keyboardType: TextInputType.number,
                   inputFormatters: [
                     MaskTextInputFormatter(mask: "##/##"),
                   ], 
                   decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Expiración',
                    hintText: '03/26'
                   ),
                ),
 );
}