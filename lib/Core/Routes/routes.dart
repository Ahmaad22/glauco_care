import 'package:flutter/material.dart';
import 'package:glauco_care/Core/Shared/widgets/bottom_navigation_bar.dart';
import 'package:glauco_care/Features/Favourites/favourites_view.dart';
import 'package:glauco_care/Features/History/history_view.dart';
import 'package:glauco_care/Features/Home/home_view.dart';
import 'package:glauco_care/Features/Hospitals/hospitals_view.dart';
import 'package:glauco_care/Features/Massenger/chat_view.dart';
import 'package:glauco_care/Features/Massenger/messanger.dart';
import 'package:glauco_care/Features/OnBoarding/LogIn/login_view.dart';
import 'package:glauco_care/Features/OnBoarding/OnBoardingView1/onboarding_view1.dart';
import 'package:glauco_care/Features/OnBoarding/OnBoardingView2/onboarding_view2.dart';
import 'package:glauco_care/Features/OnBoarding/OnBoardingView3/onboarding_view3.dart';
import 'package:glauco_care/Features/OnBoarding/ResetPassword/reset_password_view.dart';
import 'package:glauco_care/Features/OnBoarding/SignUp/sign_up_view.dart';
import 'package:glauco_care/Features/OnBoarding/Splash/splash.dart';
import 'package:glauco_care/Features/Personal%20Details/personal_details.dart';
import 'package:glauco_care/Features/Profile/profile_view.dart';
import 'package:glauco_care/Features/Scan/ImageUpload/image_upload.dart';
import 'package:glauco_care/Features/Scan/OctScanUpload/oct_scan_upload.dart';
import 'package:glauco_care/Features/Scan/Result/result_view.dart';
import 'package:glauco_care/Features/Scan/ScanView/scan_view.dart';
import 'package:glauco_care/Features/Scan/SymptomsView/symptoms_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashView.routeName:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
      case OnboardingView1.routeName:
        return MaterialPageRoute(
          builder: (context) => const OnboardingView1(),
          settings: settings,
        );
      case OnboardingView2.routeName:
        return MaterialPageRoute(
          builder: (context) => const OnboardingView2(),
          settings: settings,
        );
      case OctScanUploadView.routeName:
        return MaterialPageRoute(
          builder: (context) => const OctScanUploadView(),
          settings: settings,
        );
      case ImageUploadView.routeName:
        return MaterialPageRoute(
          builder: (context) => const ImageUploadView(),
          settings: settings,
        );
      case OnboardingView3.routeName:
        return MaterialPageRoute(
          builder: (context) => const OnboardingView3(),
          settings: settings,
        );
      case SymptomsView.routeName:
        return MaterialPageRoute(
          builder: (context) => const SymptomsView(),
          settings: settings,
        );
      case HomeView.routeName:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
          settings: settings,
        );
      case FavouritesView.routeName:
        return MaterialPageRoute(
          builder: (context) => const FavouritesView(),
          settings: settings,
        );
      case ChatView.routeName:
      // return MaterialPageRoute(
      //   builder: (context) => const ChatView(),
      //   settings: settings,
      // );
      case HistoryView.routeName:
        return MaterialPageRoute(
          builder: (context) => const HistoryView(),
          settings: settings,
        );
      case PersonalDetailsView.routeName:
        return MaterialPageRoute(
          builder: (context) => PersonalDetailsView(),
          settings: settings,
        );
      // case ResultView.routeName:
      //   return MaterialPageRoute(
      //     builder: (context) => const ResultView(),
      //     settings: settings,
      //   );
      case HospitalsView.routeName:
        return MaterialPageRoute(
          builder: (context) => const HospitalsView(),
          settings: settings,
        );
      case ScanView.routeName:
        return MaterialPageRoute(
          builder: (context) => const ScanView(),
          settings: settings,
        );
      case ResetPasswordView.routeName:
        return MaterialPageRoute(
          builder: (context) => const ResetPasswordView(),
          settings: settings,
        );
      case LogInView.routeName:
        return MaterialPageRoute(
          builder: (context) => const LogInView(),
          settings: settings,
        );
      // case CreateNewPasswordView.routeName:
      //   return MaterialPageRoute(
      //     builder: (context) => const CreateNewPasswordView(),
      //     settings: settings,
      //   );
      case SignUpView.routeName:
        return MaterialPageRoute(
          builder: (context) => const SignUpView(),
          settings: settings,
        );
      // case VerificationView.routeName:
      //   return MaterialPageRoute(
      //     builder: (context) => const VerificationView(),
      //     settings: settings,
      //   );
      case MessangerView.routeName:
        return MaterialPageRoute(
          builder: (context) => const MessangerView(),
          settings: settings,
        );
      case ProfileView.routeName:
        return MaterialPageRoute(
          builder: (context) => const ProfileView(),
          settings: settings,
        );
      case CustomBottomNavigationBar.routeName:
        return MaterialPageRoute(
          builder: (context) => const CustomBottomNavigationBar(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
    }
  }
}
