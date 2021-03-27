import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vendas/app/shared/store/shared_store.dart';
import 'package:get/get.dart';

import '../../../shared/routes/app_pages.dart';
import 'components/progress_widget.dart';
import 'components/welcome_widget.dart';

class SplashScreenPage extends StatefulWidget {
  final String title;
  const SplashScreenPage({Key? key, this.title = 'Sistema Vendas'}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  List<Future> precaches = [
    Get.putAsync<SharedStore>(() => SharedStore()(), permanent: true),
    Future.delayed(Duration(seconds: 3)),
  ];

  final _animationDuration = Duration(seconds: 2);
  var _startAnimation = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 600)).then((_) {
      setState(() {
        _startAnimation = true;
      });

      Future.wait(precaches).then((_) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).primaryColor, // status bar color
        ));
        Get.offAndToNamed(Routes.LOGIN);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          WelcomeWidget(
            startAnimation: _startAnimation,
            animationDuration: _animationDuration,
          ),
          ProgressWidget(),
        ],
      ),
    );
  }
}
