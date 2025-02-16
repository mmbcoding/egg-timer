import 'package:egg_timer/ui/views/cooking.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
                    padding: EdgeInsets.only(top: 110.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "what are you making \n", // İlk satır
                            style: TextStyle(
                              fontSize: 32,
                              color: Color(0xFF6C5A2F),
                            ),
                          ),
                          TextSpan(
                            text: "today?", // Alt satır, ortalanmış
                            style: TextStyle(
                              fontSize: 32,
                              color: Color(0xFF6C5A2F),
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center, // Ortalamayı sağlar
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Cooking(timeInSeconds: 5 * 60),),);
                      },
                        child: Image.asset("assets/images/soft.png")),
                  ),
                  const Text("soft boiled",style: TextStyle(fontSize: 32),),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Cooking(timeInSeconds: 7 * 60),),);
                      },
                        child: Image.asset("assets/images/medium.png")),
                  ),
                  const Text("medium boiled",style: TextStyle(fontSize: 32),),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Cooking(timeInSeconds: 9 * 60),),);
                      },
                        child: Image.asset("assets/images/hard.png")),
                  ),
                  const Text("hard boiled",style: TextStyle(fontSize: 32),),
                ],
              )
            ],
          ),
        ),
    );
  }
}
