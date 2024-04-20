import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip quis nostrud exercitation ullamco laboris",
      style: TextStyle(
        color: Colors.grey,
        fontSize: 14,
        overflow: TextOverflow.ellipsis,
      ),
      maxLines: 5,
    );
  }
}
