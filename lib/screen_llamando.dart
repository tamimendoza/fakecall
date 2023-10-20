import 'package:audioplayers/audioplayers.dart';
import 'package:fakecall/boton_circular.dart';
import 'package:fakecall/screen_conversando.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenLlamando extends StatefulWidget {
  const ScreenLlamando({super.key});

  @override
  State<StatefulWidget> createState() => _ScreenLlamando();
}

class _ScreenLlamando extends State<ScreenLlamando> {
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  @override
  void dispose() {
    finPlayer();
    super.dispose();
  }

  void initPlayer() async {
    await player.setVolume(1.0);
    await player.play(AssetSource('llamada.mp3'));
    player.onPlayerComplete.listen((event) {
      initPlayer();
    });
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
                children: <Widget>[
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
                      color: Colors.white,
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
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BotonCircular(
                        icono: Icons.call_end,
                        iconSize: 30,
                        backgroundColor: Colors.red,
                        onPressed: () {
                          finPlayer();
                          SystemNavigator.pop();
                        },
                      ),
                      BotonCircular(
                        icono: Icons.call,
                        iconSize: 30,
                        backgroundColor: Colors.green,
                        onPressed: () {
                          finPlayer();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ScreenConversando(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
