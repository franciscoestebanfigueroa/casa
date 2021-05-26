import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';
import 'package:wapp/utilidades/temas.dart';

class RadioInternet extends StatefulWidget {
  @override
  _RadioInternetState createState() => _RadioInternetState();
}

Duration tiempototal = Duration();
Duration tiempotranscurrido = Duration();

class _RadioInternetState extends State<RadioInternet> {
  AudioPlayer _audioPlayer;
  AudioCache _audiocache;
  bool playicon = false;
  double volumen = .2;
  bool activo = false;

  @override
  void dispose() {
    _audioPlayer.dispose();
    activo = false;
    super.dispose();
  }

  @override
  void initState() {
    _audioPlayer = AudioPlayer();
    _audiocache = AudioCache(fixedPlayer: _audioPlayer);
    _audiocache.load('lily.mp3');
    super.initState();

    _audioPlayer.onAudioPositionChanged.listen((Duration p) => {
          print('Current position: $p'),
          setState(() => tiempotranscurrido = p)
        });

    _audioPlayer.onDurationChanged.listen((Duration d) {
      print('Max duration: $d');
      setState(() {
        print('tiempo total $tiempototal');
        tiempototal = d;
      });
    });
    play();
  }

  play() async {
    //_audiocache.play('lily.mp3');

    int estado =
        await _audioPlayer.setUrl('http://fmdecision.ddns.net:8000/live');
    if (estado == 1) {
      activo = true;
      // _audioPlayer.resume();
      //  _audiocache.play('lily.mp3');
      print('en uno $estado');
    } else {
      estado = 2;
      print('en cero $estado');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Radio'),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: migradiente),
        child: activo
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 200,
                      height: 200,
                      color: Colors.green,
                      child: Image.asset('assets/logo.jpg')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () {}, child: Icon(Icons.skip_previous)),
                      TextButton(
                          onPressed: () {
                            playicon
                                ? _audioPlayer.stop()
                                : _audioPlayer.resume();
                            setState(() {
                              playicon = !playicon;
                            });

                            // _audiocache.play('lily.mp3');
                          },
                          child:
                              Icon(playicon ? Icons.pause : Icons.play_arrow)),
                      TextButton(
                          onPressed: () {
                            _audioPlayer.stop();
                          },
                          child: Icon(Icons.skip_next)),
                    ],
                  ),
                  Text('${tiempotranscurrido.inSeconds}'),
                  Slider.adaptive(
                      label: tiempotranscurrido.inSeconds.toString(),
                      value: tiempotranscurrido.inSeconds.toDouble(),
                      max: (1000 + tiempotranscurrido.inSeconds.toDouble()),
                      onChanged: (value) {
                        //print(value);
                        setState(() {
                          _audioPlayer.seek(Duration(seconds: value.toInt()));
                        });
                      }),
                  Slider(
                      value: volumen,
                      onChanged: (volumenx) {
                        _audioPlayer.setVolume(volumenx);
                        setState(() {
                          volumen = volumenx;
                        });
                      }),
                  Text('Volumen ${((volumen * 100).toStringAsFixed(0))}')
                ],
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
