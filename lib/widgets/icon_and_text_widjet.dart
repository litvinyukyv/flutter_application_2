import 'package:flutter/cupertino.dart';
import 'package:test_2/widgets/small_text.dart';

class IconandTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  final Color iconColor;
  const IconandTextWidget({super.key,
    required this.icon,
    required this.text,

    required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor,),
        SizedBox(width: 5,),
        SmallText(text: text,)
      ],
    );
  }
}
