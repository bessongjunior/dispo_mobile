import 'package:flutter/material.dart';
import 'package:dispo_mobile_app/models/onboardingcontent.dart';

class Utils {
  static GlobalKey<NavigatorState> mainListNav = GlobalKey();
  static GlobalKey<NavigatorState> mainAppNav = GlobalKey();

  static List<OnboardingContent> getOnboarding() {
    return [
      OnboardingContent(
          message: 'Get to notice\ngarbage anywhere',
          img: 'onboard1'
      ),
      OnboardingContent(
          message: 'Snap an image\n or video record',
          img: 'onboard2'
      ),
      OnboardingContent(
          message: 'Send to us\nfor necessary actions',
          img: 'onboard3'
      )
    ];
  }

  static String deviceSuffix(BuildContext context) {
    String deviceSuffix = '';
    TargetPlatform platform = Theme.of(context).platform;
    switch(platform) {
      case TargetPlatform.android:
        deviceSuffix = '_android';
        break;
      case TargetPlatform.iOS:
        deviceSuffix = '_ios';
        break;
      default:
        deviceSuffix = '';
        break;
    }
    return deviceSuffix;
  }
}