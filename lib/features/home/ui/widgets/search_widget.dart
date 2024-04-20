import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [
            Color(0XFF19A1BE),
            Color(0xff7D4192),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0XFF19A1BE).withOpacity(0.5),
            // Color de sombra más suave
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 0), // Sombra hacia arriba a la izquierda
          ),
          BoxShadow(
            color: Colors.deepPurple
                .withOpacity(0.5), // Color de sombra más oscuro
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 0), // Sombra hacia abajo a la derecha
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "Search for a content",
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
            filled: true,
            fillColor: const Color(0XFF0f0f11),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
          ),
        ),
      ),
    );
  }
}
