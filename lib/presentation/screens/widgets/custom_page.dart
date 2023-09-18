part of 'widgets_part.dart';

class CustomPageBuilder extends StatelessWidget {
  const CustomPageBuilder({
    super.key,
    required this.builder,
    this.appBar,
  });

  final Widget Function(BuildContext, bool, Size) builder;
  final Widget? appBar;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StarsBackgroundDrawer(),
        Builder(
          builder: (context) => builder(context, context.isDesktop, context.screenSize),
        ),
        if (appBar != null) appBar!,
      ],
    );
  }
}
