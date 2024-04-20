import 'package:flutter/material.dart';

import 'package:rick_morty_app/features/home/ui/widgets/characters_widget.dart';
import 'package:rick_morty_app/features/home/ui/widgets/search_widget.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'homes_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0XFF292929),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, kToolbarHeight * 1.3, 30, 10),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Search for a content",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              SearchWidget(),
              SizedBox(height: 16),
              Text(
                "Characters",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 16),
              CharactersWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
