part of 'widgets_part.dart';

class WarpSpeedDrawer extends StatefulWidget {
  const WarpSpeedDrawer({super.key});

  @override
  State<WarpSpeedDrawer> createState() => _WarpSpeedDrawerState();
}

class _WarpSpeedDrawerState extends State<WarpSpeedDrawer> with SingleTickerProviderStateMixin {
  var updateTime = 0.0;
  Ticker? ticker;

  @override
  void initState() {
    super.initState();
    ticker = createTicker((elapsed) {
      updateTime = elapsed.inMilliseconds / 1000;
      setState(() {});
    });
    ticker?.start();
  }

  @override
  void dispose() {
    ticker?.dispose();
    super.dispose();
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
          return CustomPaint(painter: _WarpSpeedPainter(shader));
        } else {
          return Container();
        }
      },
    );
  }

  Future<FragmentProgram> _initShader() {
    return FragmentProgram.fromAsset("assets/shaders/warp_speed.glsl");
  }
}

class _WarpSpeedPainter extends CustomPainter {
  _WarpSpeedPainter(this.shader);

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
