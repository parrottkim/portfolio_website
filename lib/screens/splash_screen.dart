import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_website/animations/polygon_indicator_animation.dart';
import 'package:portfolio_website/screens/home/controller/home_controller.dart';
import 'package:portfolio_website/screens/main/main_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final List _images = [
    AssetImage('assets/images/iphone.png'),
    AssetImage('assets/images/portfolio1.png'),
    AssetImage('assets/images/portfolio2.png'),
    AssetImage('assets/images/portfolio3.png'),
    AssetImage('assets/images/profile.png'),
  ];

  Future<void> _loadImage(ImageProvider provider) async {
    final config = ImageConfiguration(
      bundle: rootBundle,
      devicePixelRatio: 1,
      platform: defaultTargetPlatform,
    );
    final Completer<void> completer = Completer();
    final ImageStream stream = provider.resolve(config);

    late final ImageStreamListener listener;

    listener = ImageStreamListener((ImageInfo image, bool sync) {
      debugPrint("Image ${image.debugLabel} finished loading");
      completer.complete();
      stream.removeListener(listener);
    }, onError: (dynamic exception, StackTrace? stackTrace) {
      completer.complete();
      stream.removeListener(listener);
      FlutterError.reportError(FlutterErrorDetails(
        context: ErrorDescription('image failed to load'),
        library: 'image resource service',
        exception: exception,
        stack: stackTrace,
        silent: true,
      ));
    });

    stream.addListener(listener);
    return completer.future;
  }

  _preloading() async {
    for (var element in _images) {
      await _loadImage(element);
    }
    await Future.delayed(
      Duration(milliseconds: 2000),
    );
    // context.pushReplacement('/main');
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => MainScreen(),
        transitionDuration: Duration(milliseconds: 200),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeController>(context, listen: false).loadVideo();
    });
    _preloading();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: PolygonProgressIndicator(
          width: 60.0,
          height: 60.0,
          child: SvgPicture.asset(
            'assets/icons/parrot.svg',
            colorFilter: ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
