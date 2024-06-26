import 'package:go_router/go_router.dart';
import 'package:rick_morty_app/features/details/ui/screen/details_screen.dart';
import 'package:rick_morty_app/features/home/ui/screen/home_screen.dart';
import 'package:rick_morty_app/features/onboarding/ui/screen/onboarding_screen.dart';

final appRoutes = GoRouter(
  initialLocation: '/onboardingscreen',
  routes: [
    GoRoute(
      path: '/onboardingscreen',
      name: OnboardingScreen.name,
      builder: (_, __) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/home_screen',
      name: HomeScreen.name,
      builder: (_, __) => const HomeScreen(),
    ),
    GoRoute(
      path: '/detail_screen/:id',
      name: DetailScreen.name,
      builder: (contex, state) {
        final String? id = state.pathParameters["id"];

        return DetailScreen(id: id ?? 'default id');
      },
    ),
  ],
);
