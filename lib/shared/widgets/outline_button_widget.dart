import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_morty_app/features/home/ui/screen/home_screen.dart';

class OutlineButtonWidget extends StatelessWidget {
  const OutlineButtonWidget({
    super.key,
    required this.name,
    this.onSelected,
  });

  final String name;
  final VoidCallback? onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Align(
            alignment: const AlignmentDirectional(0, 0),
            child: TextButton(
              onPressed: onSelected,
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
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                ),
              ),
              child: Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
