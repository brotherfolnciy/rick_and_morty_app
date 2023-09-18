import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/presentation/consts/text_styles.dart';

class InfoTile extends StatelessWidget {
  const InfoTile({
    required this.tittle,
    required this.info,
    super.key,
    this.fontSize = 24,
  });

  final String tittle;
  final String info;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tittle,
          style: AppTextStyles.bold.copyWith(fontSize: fontSize),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            info,
            style: AppTextStyles.light.copyWith(fontSize: fontSize),
          ),
        ),
      ],
    );
  }
}
