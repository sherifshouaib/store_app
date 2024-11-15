

import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';

class InkWellChild extends StatelessWidget {
  const InkWellChild({
    super.key,
    required this.mObj,
    required this.countBase,
  });


  final Map mObj;
  final int countBase;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
                color: TColor.textfield,
                borderRadius: BorderRadius.circular(5)),
            margin: const EdgeInsets.only(right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: TColor.placeholder,
                      borderRadius: BorderRadius.circular(25)),
                  alignment: Alignment.center,
                  child: Image.asset(mObj["image"].toString(),
                      width: 25, height: 25, fit: BoxFit.contain),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    mObj["name"].toString(),
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                if (countBase > 0)
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12.5)),
                    alignment: Alignment.center,
                    child: Text(
                      countBase.toString(),
                      style: TextStyle(
                          color: TColor.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: TColor.textfield,
                borderRadius: BorderRadius.circular(15)),
            child: Image.asset("assets/images/btn_next.png",
                width: 10, height: 10, color: TColor.primaryText),
          ),
        ],
      ),
    );
  }
}
