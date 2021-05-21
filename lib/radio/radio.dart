import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class RadioInternet extends StatefulWidget {
  @override
  _RadioInternetState createState() => _RadioInternetState();
}

class _RadioInternetState extends State<RadioInternet> {
  AudioPlayer _audioPlayer;
  AudioCache _audiocache;

  Duration tiempototal = Duration();
  Duration tiempotranscurrido = Duration();

  @override
  void initState() {
    _audioPlayer = AudioPlayer();
    _audiocache = AudioCache(fixedPlayer: _audioPlayer);
    _audiocache.load('lily.mp3');
    super.initState();
  }

  SeekToSeg(double value) {
    Duration nuevotiempo = Duration(seconds: value.toInt());
    _audioPlayer.seek(nuevotiempo);
  }

  Widget slider() {
    return Slider.adaptive(
        value: tiempotranscurrido.inSeconds.toDouble(),
        max: tiempototal.inSeconds.toDouble(),
        onChanged: (value) {
          SeekToSeg(value);
        });
  }

  @override
  Widget build(BuildContext context) {
    play() {
      _audiocache.play('lily.mp3');
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Radio'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(onPressed: () {}, child: Icon(Icons.skip_previous)),
                TextButton(
                    onPressed: () {
                      play();
                    },
                    child: Icon(Icons.play_arrow)),
                TextButton(onPressed: () {}, child: Icon(Icons.skip_next)),
              ],
            ),
            slider()
          ],
        ),
      ),
    );
  }
}
