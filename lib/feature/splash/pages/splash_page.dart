import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../info/cubit/get_all_info_cubit.dart';
import '../../main/pages/main_page.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/splash';

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Call getAllPublicCompanyInformation API when initState.
    context.read<GetAllInfoCubit>().getAllPublicCompanyInformation();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetAllInfoCubit, GetAllInfoState>(
      listener: (context, state) {
        state.whenOrNull(
          // When success, navigate to main page.
          success: (_) {
            Navigator.of(context).pushReplacementNamed(MainPage.routeName);
          },
        );
      },
      child: Scaffold(
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
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: BlocBuilder<GetAllInfoCubit, GetAllInfoState>(
        builder: (context, state) {
          return state.maybeWhen(
            failed: (failure) {
              return const Text('發生錯誤');
            },
            orElse: () {
              return const CupertinoActivityIndicator();
            },
          );
        },
      ),
    );
  }
}
