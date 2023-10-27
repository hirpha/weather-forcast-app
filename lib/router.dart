import 'package:go_router/go_router.dart';
import 'package:weather_app/screens/country_detail.dart';
import 'package:weather_app/screens/home.dart';
import 'package:weather_app/screens/onboarding.dart';
import 'package:weather_app/screens/signin.dart';
import 'package:weather_app/screens/signup.dart';
import 'package:weather_app/screens/splash.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'splash',
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      name: 'signin',
      path: '/signin',
      builder: (context, state) => const SigninScreen(),
    ),
    GoRoute(
      name: 'signup',
      path: '/signup',
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      name: 'onboarding',
      path: '/onboarding',
      builder: (context, state) => OnboardingScreen(),
    ),
    GoRoute(
      name: 'country_detail',
      path: '/country_detail',
      builder: (context, state) => const CountryDetail(),
    ),
  ],
);
