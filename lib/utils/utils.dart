import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../resources/color.dart';
import 'global.dart';

enum Result {success, warning, error}

class Utils {
  static double averageRating(List<double> ratings) {
    if (ratings.isEmpty) {
      return 0.0;
    }
    var sum = 0;
    for (var rating in ratings) {
      sum += rating.toInt();
    }
    return sum / ratings.length;
  }

  static void fieldFocusChange(FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(navigatorKey.currentContext!).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  static void flushBarErrorMessage(String message, {int duration = 3}) {
    showFlushbar(
      context: navigatorKey.currentContext!,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        message: message,
        duration: Duration(seconds: duration),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: const Icon(
          Icons.error,
          size: 28,
          color: Colors.white,
        ),
      )..show(navigatorKey.currentContext!),
    );
  }

  static snackBar(String message,{Result result = Result.success,int duration = 3}) {
    Color getColor(result){
      if(result == Result.warning){
        return AppColor.warning;
      }
      if(result == Result.error){
        return AppColor.error;
      }
      return AppColor.primary;
    }
    return ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        backgroundColor: getColor(result),
        content: Text(message),
        duration: Duration(seconds: duration),
      ),
    );
  }
}
