import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_morty_app/features/home/ui/screen/home_screen.dart';

import 'package:rick_morty_app/shared/widgets/outline_button_widget.dart';

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
          OutlineButtonWidget(
            name: 'Enter now',
            onSelected: () {
              context.pushNamed(HomeScreen.name);
            },
          ),
        ],
      ),
    );
  }
}
