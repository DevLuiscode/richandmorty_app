import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class OnboardingScreen extends StatelessWidget {
  static const name = "onboardingscreen";
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF292929),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/1.png'),
          const Text(
            "OnBarding",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 32,
            ),
            textAlign: TextAlign.center,
          ),
          const Text(
            "Entera de los personajes\n de rick and morty",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            height: 100,
            color: Colors.transparent,
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(-0.3, 0.0),
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0XFF19A1BE),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0XFF19A1BE),
                          spreadRadius: 22,
                          blurRadius: 22,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.3, 0),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff7D4192),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff7D4192),
                          spreadRadius: 20,
                          blurRadius: 22,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                ),
                // Align(
                //   alignment: const AlignmentDirectional(0, 0),
                //   child: Container(
                //     height: 50,
                //     width: 200,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20),
                //       border: Border.all(
                //         width: 2,
                //         color: const Color(0XFF19A1BE),
                //       ),
                //     ),
                //     child: const Center(
                //       child: Text(
                //         "Enter now",
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           color: Colors.white,
                //           fontSize: 16,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      // Configura el fondo del botón
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      // Configura el borde del botón
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: const BorderSide(
                            color: Color(0XFF19A1BE),
                            width: 2.0,
                          ),
                        ),
                      ),
                      // Configura otros aspectos del estilo si es necesario
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12.0),
                      ),
                    ),
                    child: const Text(
                      "Enter now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
