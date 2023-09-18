part of 'widgets_part.dart';

class StarsBackgroundDrawer extends StatefulWidget {
  const StarsBackgroundDrawer({super.key});

  @override
  State<StarsBackgroundDrawer> createState() => _StarsBackgroundDrawerState();
}

class _StarsBackgroundDrawerState extends State<StarsBackgroundDrawer> with SingleTickerProviderStateMixin {
  var updateTime = 0.0;

  @override
  void initState() {
    super.initState();
    createTicker((elapsed) {
      updateTime = elapsed.inMilliseconds / 1000;
      setState(() {});
    }).start();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FragmentProgram>(
      future: _initShader(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final shader = snapshot.data!.fragmentShader()
            ..setFloat(0, updateTime)
            ..setFloat(1, 300)
            ..setFloat(2, 300);
          return CustomPaint(painter: _StarsBackgroundPainter(shader));
        } else {
          return Container();
        }
      },
    );
  }

  Future<FragmentProgram> _initShader() {
    return FragmentProgram.fromAsset("assets/shaders/stars_background.glsl");
  }
}

class _StarsBackgroundPainter extends CustomPainter {
  _StarsBackgroundPainter(this.shader);

  final Shader shader;

  @override
  void paint(Canvas canvas, Size size) {
    const Rect rect = Rect.largest;
    final Paint paint = Paint()..shader = shader;
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
