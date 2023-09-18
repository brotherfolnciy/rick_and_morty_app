part of 'helpers_part.dart';

extension BuildContextExtension on BuildContext {
  bool get isDesktop {
    final size = MediaQuery.of(this).size;
    return size.height < size.width;
  }

  Size get screenSize => MediaQuery.of(this).size;
}
