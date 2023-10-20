import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:fakecall/boton_circular.dart';
import 'package:fakecall/boton_texto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenConversando extends StatefulWidget {
  const ScreenConversando({super.key});

  @override
  State<StatefulWidget> createState() => _ScreenConversando();
}

class _ScreenConversando extends State<ScreenConversando> {
  final player = AudioPlayer();
  int _tiempoLlamada = 0;
  String _formatoTiempo = '00:00';
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _tiempoLlamada++;
        final minutos = (_tiempoLlamada ~/ 60).toString().padLeft(2, '0');
        final segundos = (_tiempoLlamada % 60).toString().padLeft(2, '0');
        _formatoTiempo = '$minutos:$segundos';
      });
    });

    initPlayer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    finPlayer();
    super.dispose();
  }

  void initPlayer() async {
    await player.setVolume(1.0);
    await player.play(AssetSource('mensaje.mp3'));
  }

  void finPlayer() async {
    await player.stop();
    await player.release();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Colors.black87,
              Colors.blue[900]!,
              Colors.black87,
            ],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BotonCircular(
                    icono: Icons.person,
                    iconSize: 50,
                    backgroundColor: Colors.white10,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Tomas',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '+34 123 456 789 España',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _formatoTiempo,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: BotonTexto(
                    icono: Icons.person_rounded,
                    texto: 'Contactos',
                  ),
                ),
                Expanded(
                  child: BotonTexto(
                    icono: Icons.add,
                    texto: 'Agregar llamada',
                  ),
                ),
                Expanded(
                  child: BotonTexto(
                    icono: Icons.edit_note,
                    texto: 'Nota',
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: BotonTexto(
                    icono: Icons.mic_off,
                    texto: 'Silenciar',
                  ),
                ),
                Expanded(
                  child: BotonTexto(
                    icono: Icons.pause_circle_outline,
                    texto: 'Pausar',
                  ),
                ),
                Expanded(
                  child: BotonTexto(
                    icono: Icons.voicemail,
                    texto: 'Grabar',
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 40,
                bottom: 40,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: BotonCircular(
                      icono: Icons.volume_up,
                      iconSize: 35,
                      backgroundColor: Colors.transparent,
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: BotonCircular(
                      icono: Icons.call_end,
                      iconSize: 35,
                      backgroundColor: Colors.red,
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                    ),
                  ),
                  Expanded(
                      child: BotonCircular(
                    icono: Icons.dialpad,
                    iconSize: 35,
                    backgroundColor: Colors.transparent,
                    onPressed: () {},
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
