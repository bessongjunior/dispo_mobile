import 'package:flutter/material.dart';
import 'package:dispo_mobile/models/onboardingcontent.dart';


class Utils {

  static GlobalKey<NavigatorState> mainListNav = GlobalKey();
  static GlobalKey<NavigatorState> mainAppNav = GlobalKey();

  static List<OnboardingContent> getOnboarding() {
    return [
      OnboardingContent(
          message: 'Productos\nfrescos, de la\ntierra a su mesa',
          img: 'onboard1'
      ),
      OnboardingContent(
          message: 'Carnes y embutidos\nfrescos y saludables\npara su deleite',
          img: 'onboard2'
      ),
      OnboardingContent(
          message: 'Adquiéralos desde\nla comodidad de su\ndispositivo móbil',
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