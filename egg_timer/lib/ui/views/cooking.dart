import 'package:egg_timer/ui/views/finish.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Cooking extends StatefulWidget {
  final int timeInSeconds;
  const Cooking({super.key, required this.timeInSeconds});

  @override
  State<Cooking> createState() => _CookingState();
}

class _CookingState extends State<Cooking> {
  int _currentIndex = 0;
  final List<String> imagePaths = [
    'assets/images/timer1.PNG',
    'assets/images/timer2.PNG',
    'assets/images/timer3.PNG',
    'assets/images/timer4.PNG',
  ];

  late int _remainingTime; // 5 dakika (300 saniye)
  late Timer _timer;


  @override
  void initState() {
    super.initState();
    _startAnimation();
    _remainingTime = widget.timeInSeconds; // Başlangıç zamanı
    _startTimer();
  }

  void _startAnimation() {
    Timer.periodic(Duration(milliseconds: 350), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % imagePaths.length;
      });
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel(); // Timer'ı durdur
          _navigateToNextPage(); // Timer bittiğinde başka sayfaya yönlendir
        }
      });
    });
  }

  void _navigateToNextPage() {
    // Timer bittiğinde yönlendireceğiniz sayfa (örneğin 'NextPage')
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Finish()), // 'NextPage' yerine istediğiniz sayfayı ekleyin
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Timer'ı temizle
    super.dispose();
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
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
                  padding: EdgeInsets.only(top: 115.0),
                  child: Text(
                    "Your egg is ready in...",
                    style: TextStyle(
                      fontSize: 32,
                      color: Color(0xFF6C5A2F),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 100),
                    child: Image.asset(
                      imagePaths[_currentIndex],
                      key: ValueKey<int>(_currentIndex),
                      width: 150,
                      height: 200,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text(
                    _formatTime(_remainingTime),
                    style: const TextStyle(
                      fontSize: 96,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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

