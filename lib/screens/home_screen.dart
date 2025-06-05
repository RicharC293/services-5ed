import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:services_app/notifiers/services_notifier.dart';
import 'package:services_app/screens/details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<ServicesNotifier>().fetchServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.asset(
              "assets/image_general.png",
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Servicios",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Consumer<ServicesNotifier>(
                      builder: (context, notifier, _) {
                        if (notifier.status == ServiceStatus.loading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (notifier.status == ServiceStatus.error) {
                          return const Center(
                            child: Text("Error al cargar los servicios"),
                          );
                        }
                        final services = notifier.services;
                        return RefreshIndicator(
                          onRefresh: () async {
                            await notifier.fetchServices();
                          },
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              final service = services[index];
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    service.icon.formats["thumbnail"]!.url,
                                  ),
                                ),
                                trailing: Icon(Icons.arrow_forward_ios),
                                title: Text(service.name),
                                onTap: () {
                                  // Navigate to details screen
                                  Navigator.pushNamed(
                                    context,
                                    DetailsScreen.routeName,
                                    arguments: service,
                                  );
                                },
                              );
                            },
                            itemCount: services.length,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
