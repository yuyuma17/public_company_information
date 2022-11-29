import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SplashPage extends StatelessWidget {
  static const routeName = '/splash';
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              _SplashImage(),
              Text('臺灣證券交易所'),
              _UpdateIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SplashImage extends StatelessWidget {
  const _SplashImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/zh/thumb/6/64/TWSE_logo.svg/250px-TWSE_logo.svg.png',
      errorWidget: (_, __, ___) => const SizedBox.shrink(),
    );
  }
}

class _UpdateIndicator extends StatelessWidget {
  const _UpdateIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 100.0),
      child: CupertinoActivityIndicator(),
    );
  }
}
