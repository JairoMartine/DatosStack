import 'package:flutter/material.dart';

class PruebaStack extends StatelessWidget {
  const PruebaStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Stack'),
      ),
      body: Center(
        child: SizedBox(
          width: 300.0,
          height: 300.0,
          child: Center(
            child: Stack(
             clipBehavior: Clip.antiAliasWithSaveLayer,
             fit: StackFit.expand,
             overflow: Overflow.visible,
             children:<Widget> [
               Container(
                 width: 300.0,
                 height: 300,
                 color: Colors.red,
               ),
               Positioned(
                 top: 80.0,
                 left: 80.0,
                 child: Container(
                   width: 250.0,
                   height: 250.0,
                   color: Colors.black,
                 )
              ),
               Positioned(
                 top: 20.0,
                 left: 20.0,
                 child: Container(
                   width: 300.0,
                   height: 210.0,
                    //padding: const EdgeInsets.all(15.0),
                    decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://www.google.com.mx/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
                      scale: 2.0)
                      ),
                    
                    ),
                  // color: Colors.black,
                 )
              )
             ], 
            ),
           ),
          
          )
      )
    );
  }

  Widget stackSinPos(){
    return Center(
        child: SizedBox(
          width: 300.0,
          height: 300.0,
          child: Center(
            child: Stack(
              //clipBehavior: Clip.antiAliasWithSaveLayer,
              //fit: StackFit.expand,
              children: <Widget>[
                Container(
                  width: 300.0,
                  height: 300.0,
                  color: Colors.red,
                  padding: const EdgeInsets.all(15.0),
                  alignment: Alignment.topRight,
                  child: const Text('Uno',
                   style: TextStyle(
                     color: Colors.white
                   ),
                   ),
                ),
                Container(
                  width: 250.0,
                  height: 250.0,
                  color: Colors.black,
                  padding: const EdgeInsets.all(15.0),
                  alignment: Alignment.topRight,
                  child: const Text('Dos',
                   style: TextStyle(
                     color: Colors.white
                   ),
                   ),

                ),
                Container(
                  width: 250.0,
                  height: 250.0,
                  //color: Colors.purple,
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(15.0),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://www.google.com.mx/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
                      scale: 10.0)
                      ),
                    ),
                  child: const Text('Tres',
                      style: TextStyle(
                        color: Colors.white
                      ),
                   ),
                ),
              ],
            ),
            ),
        ),
      );
  }
}