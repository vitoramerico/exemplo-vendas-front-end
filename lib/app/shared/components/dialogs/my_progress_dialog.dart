import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MyProgressDialogModel extends ChangeNotifier {
  String message = ' ';
  bool? isSuccess;

  void setMessage(String value) {
    this.message = value;
    notifyListeners();
  }

  void setSuccess(String msg) {
    this.message = msg;
    this.isSuccess = true;
    notifyListeners();
  }

  void setError(String msg) {
    this.message = msg;
    this.isSuccess = false;
    notifyListeners();
  }

  void setDefaultValue() {
    this.message = ' ';
    this.isSuccess = null;
    notifyListeners();
  }
}

class MyProgressDialog extends MyProgressDialogModel {
  static const animProgress = 'assets/animations/dialog_anim_progress.json';
  static const animSucess = 'assets/animations/dialog_anim_success.json';
  static const animError = 'assets/animations/dialog_anim_error.json';

  void showCircularProgress() {
    FocusManager.instance.primaryFocus?.unfocus();

    setDefaultValue();

    Get.dialog(
      AnimatedBuilder(
        animation: this,
        builder: (context, _) {
          var assetAnimation = _getAnimation(isSuccess);
          var width = MediaQuery.of(context).size.width * 0.7;

          return Center(
            child: Card(
              elevation: 4,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: width < 400 ? width : 400,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Lottie.asset(
                          assetAnimation,
                          height: 50,
                          width: 50,
                          repeat: isSuccess == null ? true : false,
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            message,
                            style: Get.textTheme?.headline6,
                            maxLines: 8,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    AnimatedOpacity(
                      opacity: isSuccess != null ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 600),
                      child: TextButton(
                        child: Text(
                          'OK',
                          textAlign: TextAlign.end,
                        ),
                        onPressed: isSuccess != null ? () => Get.back() : null,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
      barrierDismissible: false,
    );
  }

  static String _getAnimation(bool? isSuccess) {
    if (isSuccess == null) return animProgress;

    if (!isSuccess) return animError;

    return animSucess;
  }
}
