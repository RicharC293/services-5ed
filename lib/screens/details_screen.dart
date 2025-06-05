import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:services_app/models/service_model.dart';
import 'package:services_app/notifiers/theme_notifier.dart';
import 'package:services_app/screens/create_service_screen.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  static const String routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final service = ModalRoute.of(context)!.settings.arguments as ServiceModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles del Servicio"),
        actions: [
          IconButton(
            icon: Icon(
              context.watch<ThemeNotifier>().isDarkMode
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              context.read<ThemeNotifier>().isDarkMode = !context
                  .read<ThemeNotifier>()
                  .isDarkMode;
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                service.banner.formats["large"]!.url,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              service.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(service.description, style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text(
              "Precio: \$${service.price.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FilledButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              CreateServiceScreen.routeName,
              arguments: service,
            );
          },
          child: const Text("Agendar Servicio"),
        ),
      ),
    );
  }
}
