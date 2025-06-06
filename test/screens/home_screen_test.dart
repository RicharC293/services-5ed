import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:services_app/models/service_model.dart';
import 'package:services_app/notifiers/services_notifier.dart';
import 'package:services_app/screens/home_screen.dart';
import 'package:services_app/services/api.dart';

class FakeApi extends Api {
  FakeApi(this.services);
  final List<ServiceModel> services;

  @override
  Future<List<ServiceModel>> getServices() async {
    return services;
  }
}

ServiceModel _buildService(String name) {
  final format = Format(
    ext: '.png',
    url: 'http://example.com/$name.png',
    hash: 'hash',
    mime: 'image/png',
    name: name,
    width: 48,
    height: 48,
    size: 1.0,
    sizeInBytes: 1000,
  );
  final media = Media(
    id: 1,
    documentId: 'doc',
    name: '$name.png',
    width: 48,
    height: 48,
    formats: {'thumbnail': format},
    hash: 'hash',
    ext: '.png',
    mime: 'image/png',
    size: 1.0,
    url: 'http://example.com/$name.png',
    previewUrl: null,
  );
  return ServiceModel(
    id: 1,
    documentId: '1',
    name: name,
    description: 'desc',
    price: 10,
    createdAt: '2024',
    updatedAt: '2024',
    publishedAt: '2024',
    icon: media,
    banner: media,
  );
}

void main() {
  testWidgets('HomeScreen shows service list', (WidgetTester tester) async {
    final services = [_buildService('Service')];
    final notifier = ServicesNotifier(api: FakeApi(services));

    await tester.pumpWidget(
      ChangeNotifierProvider<ServicesNotifier>.value(
        value: notifier,
        child: const MaterialApp(home: HomeScreen()),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Servicios'), findsOneWidget);
    expect(find.text('Service'), findsOneWidget);
  });
}
