import 'package:egg_timer/ui/views/anasayfa.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

class Finish extends StatefulWidget {
  const Finish({super.key});

  @override
  State<Finish> createState() => _FinishState();
}

class _FinishState extends State<Finish> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;

  int _currentIndex = 0;
  final List<String> imagePaths = [
    'assets/images/egg1.PNG',
    'assets/images/egg2.PNG',
    'assets/images/egg3.PNG',
  ];

  void _startAnimation() {
    Timer.periodic(const Duration(milliseconds: 350), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % imagePaths.length;
      });
    });
  }

  void playMusic() async {
    // Müziği sürekli çalmak için loop özelliğini etkinleştir
    await audioPlayer.play(AssetSource('music/zilsesi.mp3'));
    await audioPlayer.setReleaseMode(ReleaseMode.loop); // Müziği sürekli tekrar et
    setState(() {
      isPlaying = true;
    });
  }

  void stopMusic() async {
    await audioPlayer.stop();
    setState(() {
      isPlaying = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _startAnimation();
    playMusic();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/images/background.png",
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 130.0),
                  child: Text(
                    "Your egg is done!",
                    style: TextStyle(
                      fontSize: 32,
                      color: Color(0xFF6C5A2F),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 100),
                    child: Image.asset(
                      imagePaths[_currentIndex],
                      key: ValueKey<int>(_currentIndex),
                      width: 150,
                      height: 200,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: ElevatedButton(
                    onPressed: () {
                      stopMusic(); // Snooze butonuna basıldığında müziği durdur
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFDE8B1),
                      shadowColor: Colors.transparent, // Gölgeyi kaldır
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // Kenarları dik yap
                        side: BorderSide(
                          color: Color(0xFFD3773D), // Stroke rengi
                          width: 3, // Stroke kalınlığı
                        ),
                      ),
                    ),
                    child: const Text(
                      "Snooze",
                      style: TextStyle(
                          fontSize: 48,
                          color: Color(0xFFD3773D)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: ElevatedButton(
                    onPressed: () {
                      stopMusic(); // Close butonuna basıldığında müziği durdur
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Anasayfa()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFDE8B1),
                      shadowColor: Colors.transparent, // Gölgeyi kaldır
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // Kenarları dik yap
                        side: BorderSide(
                          color: Color(0xFFD3773D), // Stroke rengi
                          width: 3, // Stroke kalınlığı
                        ),
                      ),
                    ),
                    child: const Text(
                      "  Close  ",
                      style: TextStyle(
                          fontSize: 48,
                          color: Color(0xFFD3773D)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}