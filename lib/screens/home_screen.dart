import 'package:flutter/material.dart';
import 'package:services_app/screens/details_screen.dart';
import 'package:services_app/services/api.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

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
                    child: FutureBuilder(
                      future: Api().getServices(),
                      builder: (context, data) {
                        if (data.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (data.hasError) {
                          return Center(child: Text('Error: ${data.error}'));
                        } else if (!data.hasData) {
                          return const Center(
                            child: Text('No services available'),
                          );
                        }
                        final services = data.data!;
                        return ListView.builder(
                          shrinkWrap: true,
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
