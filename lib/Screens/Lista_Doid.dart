import 'dart:math';

import 'package:camera/camera.dart';
import 'package:doidometro1/Controllers/Analise_doidera.dart';
import 'package:doidometro1/Screens/Camera_flutter.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  TelaInicial({Key? key}) : super(key: key);
  final List<Doidera> _doideras = [];

  @override
  State<StatefulWidget> createState() {
    return _TelaInicialState();
  }
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Doidômetro',
          style: TextStyle(
              fontSize: 32, color: Colors.black, fontStyle: FontStyle.italic),
        ),
      ),
      body: ListView.builder(
          itemCount: widget._doideras.length,
          itemBuilder: (context, indice) {
            final loucura = widget._doideras[indice];
            return ItemAnalisado(loucura);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _handleOpenCamera(context);
          // final String fraseta =
          //     '${Doidera().getfrase()}\n${Doidera().getHora()}';
          // debugPrint(fraseta);
          // final snackBar = SnackBar(
          //   content: Text(fraseta),
          //   action: SnackBarAction(
          //     label: 'Dismiss',
          //     onPressed: () {
          //       // Some code to undo the change.
          //     },
          //   ),
          // );
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Icon(Icons.add_a_photo),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.grey,
        child: Text('Patrocinio Motora.ai',
            style: TextStyle(
              fontSize: 24,
              fontStyle: FontStyle.italic,
              color: Colors.black,
            )),
      ),
    );
  }

  // void _atualiza(Doidera? transferenciaRecebida) {
  //   if (transferenciaRecebida != null) {
  //     setState(() {
  //       widget._doideras.add(transferenciaRecebida);
  //     });
  //   }
  // }

  void _atualiza(String transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      final d = new Doidera();
      setState(() {
        widget._doideras.add(d);
      });
    }
  }

  Future _handleOpenCamera(BuildContext context) async {
    final cameras = await availableCameras();
    // final frontCam = cameras[1];
    final Future<Doidera?> future =
        Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TakePictureScreen(
        camera: cameras.firstWhere(
            (camera) => camera.lensDirection == CameraLensDirection.front),
      );
    })).then((res) {
      print(res);
      final d = new Doidera();
      setState(() {
        widget._doideras.add(d);
      });
    });
    // print(future);
    // future.then((transferenciaRecebida) {
    //   Future.delayed(const Duration(seconds: 1), () {
    //     debugPrint('Chegou no then do future.');
    //     debugPrint('$transferenciaRecebida');
    //     _atualiza(transferenciaRecebida);
    //   });
    // });
  }
}

class ItemAnalisado extends StatelessWidget {
  final Doidera _doidera1;

  ItemAnalisado(this._doidera1);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.watch_later_outlined),
        title: Text(_doidera1.getfrase()),
        subtitle: Text(_doidera1.getHora()),
      ),
    );
  }
}
