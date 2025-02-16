import 'package:egg_timer/ui/views/menu.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
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
                  padding: EdgeInsets.only(right: 200.0),
                  child: Text(
                    "Egg timer",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFFC55F00),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 290.0),
                  child: Text(
                    "LET'S TIME \n YOUR EGG",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF6C5A2F),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: ElevatedButton(
                    onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Menu(),),);
                  },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFDE8B1),
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
                      "START",
                      style: TextStyle(
                        fontSize: 48,
                        color: Color(0xFFD3773D)
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

