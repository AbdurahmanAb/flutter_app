import '../utils/colors.dart';
import '../widgets/headers.dart';
import 'package:flutter/material.dart';

import '../utils/Dimensions.dart';
import 'icon_menu.dart';
import 'subtitle.dart';

class AppDescCol extends StatelessWidget {
  final String text;
  const AppDescCol({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Header(text: text),
        SizedBox(
          height: Dimensions.height15,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) => Icon(
                        Icons.star,
                        size: Dimensions.height20,
                        color: AppColors.mainColor,
                      )),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            Subtitle(text: "4.5"),
            SizedBox(
              width: Dimensions.width15,
            ),
            Subtitle(text: "2607"),
            SizedBox(
              width: 5,
            ),
            Subtitle(text: "Comments")
          ],
        ),
        SizedBox(
          height: Dimensions.height25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconMenu(
                text: "Normal",
                icon: Icons.cabin,
                iconColor: Colors.amberAccent),
            IconMenu(
                text: "1.7KM",
                icon: Icons.location_on_outlined,
                iconColor: AppColors.mainColor),
            IconMenu(
                text: "32 Min",
                icon: Icons.timer_outlined,
                iconColor: Colors.red)
          ],
        )
      ],
    );
  }
}
