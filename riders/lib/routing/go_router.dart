import 'package:go_router/go_router.dart';
import 'package:riders/routing/app_routes.dart';
import 'package:riders/ui/Login/widgets/login_screen.dart';
import 'package:riders/ui/Login/widgets/register_screen.dart';
import 'package:riders/ui/SplashView/widgets/splashview_screen.dart';
import 'package:riders/ui/home/widgets/HomeScreen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splashPath,
  routes: <RouteBase>[
    // Rota da Splash Screen
    GoRoute(
      name: AppRoutes.splash,
      path: AppRoutes.splashPath,
      builder: (context, state) => const SplashScreen(),
    ),
    // Rota de Login
    GoRoute(
      name: AppRoutes.login,
      path: AppRoutes.loginPath,
      builder: (context, state) => const LoginScreen(),
    ),
    // Rota da Home
    GoRoute(
      name: AppRoutes.register,
      path: AppRoutes.registerPath,
      builder: (context, state) => const RegisterScreen(),
    ),

      GoRoute(
      name: AppRoutes.home,
      path: AppRoutes.homePath,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
