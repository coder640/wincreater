import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_volume_slider/flutter_volume_slider.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  Color color1 = Colors.white;
  Color color2 = Colors.grey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlayer();
  }

  AudioPlayer player;
  AudioCache audioCache;

  void initPlayer() {
    player = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: player);
  }

  bool isSound = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            padding: EdgeInsets.fromLTRB(45.0, 0.0, 45.0, 0.0),
            height: height,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Home.png"), fit: BoxFit.cover),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 100,
                  left: 100,
                  child: Container(
                    //color: Colors.red,
                    height: 300,
                    child: Image.asset(
                      'assets/alertbg.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 130,
                  right: 130,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset('assets/close.png'),
                  ),
                ),
                Positioned(
                  top: 150,
                  child: Text(
                    "SETTINGS".tr(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
                Positioned(
                  top: 250,
                  child: Row(
                    children: [
                      Positioned(
                        child: GestureDetector(
                          onTap: () {
                            audioCache.play("touch.mp3");
                            return context.locale = Locale('en', '');
                          },
                          child: Container(
                            height: 50,
                            child: Image.asset(
                              'assets/english.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Positioned(
                        child: GestureDetector(
                          onTap: () {
                            audioCache.play("touch.mp3");
                            return context.locale = Locale('ru', '');
                          },
                          child: Container(
                            height: 50,
                            child: Image.asset(
                              'assets/russia.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 180.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          FlutterVolumeSlider(
                            display: Display.HORIZONTAL,
                            sliderActiveColor: Color(0xFF0A3BEC),
                            sliderInActiveColor: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
