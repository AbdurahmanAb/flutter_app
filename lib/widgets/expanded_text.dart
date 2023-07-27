import 'package:e_commerce/utils/Dimensions.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/widgets/subtitle.dart';
import 'package:flutter/material.dart';

class ExpandedText extends StatefulWidget {
  final String text;
  const ExpandedText({required this.text, super.key});

  @override
  State<ExpandedText> createState() => _ExpandedTextState();
}

class _ExpandedTextState extends State<ExpandedText> {
  late String first;
  late String second;

  bool hiddenText = true;
  double textHeight = Dimensions.screeHeight / 7;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      first = widget.text.substring(0, textHeight.toInt());
      second =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      first = widget.text;
      second = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: second.isEmpty
            ? Subtitle(
                height: 1.8,
                color: Colors.black,
                size: Dimensions.font16,
                text: first)
            : Column(
                children: [
                  Subtitle(
                      height: 1.8,
                      color: Colors.black,
                      size: Dimensions.font16,
                      text: hiddenText ? first + "...." : first + second),
                  InkWell(
                    onTap: () {
                      setState(() {
                        hiddenText = !hiddenText;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: Dimensions.height10),
                      child: Row(
                        children: [
                          Subtitle(
                            text: hiddenText ? "Show More" : "Show Less",
                            color: AppColors.mainColor,
                            size: Dimensions.font16,
                          ),
                          Icon(
                            hiddenText
                                ? Icons.arrow_drop_down
                                : Icons.arrow_drop_up,
                            color: AppColors.mainColor,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ));
  }
}
