import 'package:flutter/material.dart';

class CustomRowAppbar extends StatelessWidget {
  const CustomRowAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Positioned(
              bottom: 24,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(211, 164, 255, 193),
                    shape: BoxShape.circle),
                child: const Text(
                  "8",
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_shopping_cart),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(right: 12),
          child: Text("\$ 128"),
        )
      ],
    );
  }
}
