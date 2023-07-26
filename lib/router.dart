import 'package:flutter/material.dart';
import 'package:whatsapp_clone_again/feature/auth/screen/user_information_screen.dart';

import 'core/common/widgets/error.dart';
import 'feature/auth/screen/login_screen.dart';
import 'feature/auth/screen/otp_screen.dart';

Route<dynamic> generateroute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case OTPScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => OTPScreen(
          verificationId: verificationId,
        ),
      );
    case UserInformationScreen.routeName:
      return MaterialPageRoute(builder: (context) => UserInformationScreen());
    // case SelectContactsScreen.routeName:
    //   return MaterialPageRoute(builder: (context) => SelectContactsScreen());
    // case MobileChatScreen.routeName:
    //   final arguments = settings.arguments as Map<String, dynamic>;
    //   final name = arguments['name'];
    //   final uid = arguments['uid'];

    //   return MaterialPageRoute(
    //     builder: (context) => MobileChatScreen(
    //       name: name,
    //       uid: uid,
    //     ),
    //   );

    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: ErrorScreen(error: 'This Screen dose not exis t'),
              ));
  }
}
