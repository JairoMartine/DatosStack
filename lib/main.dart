import 'package:flutter/material.dart';
import 'pages/pruebaStack.dart';
import 'pages/secondScreen.dart';
import 'pages/datosPage.dart';
import 'pages/stackEjemplo.dart';
import 'pages/formScreen.dart';
import 'pages/tarjeta.dart';

void main() { 
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Demo Flutter',
    initialRoute: '/',
    routes:{
      '/':(context) => const HomePage(),
      '/second':(context) => const SecondScreeen(),
      '/datos':(context) => const DatosPage(),
      '/stack':(context) => const PruebaStack(),
      '/pruebaStack':(context) => const StackEjemplo(),
      '/formScreen':(context) => const MyStateFulWidget(),
      '/cardScreen':(context) => const MyStateFulWidget2()

    },
  ));
}

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const Text('Página inicial'),
          leading: const Icon(Icons.menu),
          elevation: 20.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15)
              )
          ),
          actions: <Widget>[
            IconButton(
              icon:const Icon(Icons.search),
              onPressed: () => {}
              ),
          ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                   Navigator.pushNamed(context, '/second');
                  },
                  child: const Text('Segunda pantalla'),
                ),
                SizedBox(height: 10.0,),
                ElevatedButton(
                  onPressed: () {
                   Navigator.pushNamed(context, '/datos');
                  },
                  child: const Text('Datos'),
                ),
                SizedBox(height: 10.0,),
                ElevatedButton(
                  onPressed: () {
                   Navigator.pushNamed(context, '/stack');
                  },
                  child: const Text('Stack'),
                ),
                SizedBox(height: 10.0,),
                ElevatedButton(
                  onPressed: () {
                   Navigator.pushNamed(context, '/pruebaStack');
                  },
                  child: const Text('Datos Stack'),
                ),
                SizedBox(height: 10.0,),
                ElevatedButton(
                  onPressed: () {
                   Navigator.pushNamed(context, '/formScreen');
                  },
                  child: const Text('Form Screen'),
                ),
                SizedBox(height: 10.0,),
                ElevatedButton(
                  onPressed: () {
                   Navigator.pushNamed(context, '/cardScreen');
                  },
                  child: const Text('Pago con tarjeta'),
                )
              ]
            ),
          ),
      );
  }
}