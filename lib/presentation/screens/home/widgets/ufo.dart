part of 'widgets_part.dart';

class Ufo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WaveAnimator(
      multiply: 1,
      duration: Duration(milliseconds: 1750),
      child: Image.asset('assets/images/ufo.png'),
    );
  }
}
