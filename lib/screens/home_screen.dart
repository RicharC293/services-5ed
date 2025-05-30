import 'package:flutter/material.dart';

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
          Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Servicios",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/image_general.png"),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text("Servicio patito"),
                  subtitle: Text("Descripción del servicio patito"),
                  onTap: () {
                    // Navigate to details screen
                    Navigator.pushNamed(context, '/details');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
