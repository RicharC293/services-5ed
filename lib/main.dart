import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:services_app/notifiers/services_notifier.dart';
import 'package:services_app/notifiers/ticket_notifier.dart';
import 'package:services_app/notifiers/theme_notifier.dart';
import 'package:services_app/screens/home_screen.dart';
import 'package:services_app/utils/router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Aquí puedes agregar otros providers si es necesario
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider(create: (_) => ServicesNotifier()),
        ChangeNotifierProvider(create: (_) => TicketNotifier()),
      ],
      builder: (context, _) => MaterialApp(
        title: 'Servicios',
        initialRoute: HomeScreen.routeName,
        routes: router,
        theme: context.watch<ThemeNotifier>().isDarkMode
            ? ThemeData.dark()
            : ThemeData.light(),
      ),
    );
  }
}
