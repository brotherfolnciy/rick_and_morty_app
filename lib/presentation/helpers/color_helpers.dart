part of 'helpers_part.dart';

Color getColorFromSeed(int seed) {
  final r = Random(seed).nextInt(255);
  final g = Random(seed + 1).nextInt(255);
  final b = Random(seed + 2).nextInt(255);

  return Color.fromRGBO(r, g, b, 1);
}
