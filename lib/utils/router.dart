import 'package:services_app/screens/create_service_screen.dart';
import 'package:services_app/screens/details_screen.dart';
import 'package:services_app/screens/home_screen.dart';

final router = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  DetailsScreen.routeName: (context) => const DetailsScreen(),
  CreateServiceScreen.routeName: (context) => const CreateServiceScreen(),
};