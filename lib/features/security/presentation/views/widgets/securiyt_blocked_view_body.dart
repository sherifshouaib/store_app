import 'package:flutter/material.dart';

class SecurityBlockedViewBody extends StatelessWidget {
  const SecurityBlockedViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.warning, color: Colors.red, size: 80),
          SizedBox(height: 16),
          Text(
            'This app cannot run on rooted devices\nor with developer options enabled.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
