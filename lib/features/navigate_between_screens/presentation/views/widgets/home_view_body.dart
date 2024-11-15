import 'package:flutter/material.dart';

class HomeviewBody extends StatelessWidget {
  const HomeviewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 33),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: GridTile(
              footer: GridTileBar(
                //backgroundColor: Color.fromARGB(66, 73, 127, 110),
                trailing: IconButton(
                    color: const Color.fromARGB(255, 62, 94, 70),
                    onPressed: () {},
                    icon: const Icon(Icons.add)),
                leading: const Text("\$12.99"),
                title: const Text(
                  "",
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -3,
                    bottom: -9,
                    right: 0,
                    left: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(55),
                      child: Image.asset('assets/images/ali.jpg'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
