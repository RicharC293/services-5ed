import 'package:flutter_test/flutter_test.dart';
import 'package:services_app/models/service_model.dart';
import 'package:services_app/notifiers/services_notifier.dart';
import 'package:services_app/services/api.dart';

class FakeApi extends Api {
  FakeApi(this.services);
  final List<ServiceModel> services;

  @override
  Future<List<ServiceModel>> getServices() async {
    return services;
  }
}

ServiceModel _buildService() => ServiceModel(
      id: 1,
      documentId: '1',
      name: 'Service',
      description: 'desc',
      price: 10,
      createdAt: '2024',
      updatedAt: '2024',
      publishedAt: '2024',
      icon: _media,
      banner: _media,
    );

final _format = Format(
  ext: '.png',
  url: 'url',
  hash: 'hash',
  mime: 'image/png',
  name: 'img',
  width: 10,
  height: 10,
  size: 1.0,
  sizeInBytes: 100,
);

final _media = Media(
  id: 1,
  documentId: 'doc',
  name: 'img.png',
  width: 10,
  height: 10,
  formats: {'thumbnail': _format},
  hash: 'hash',
  ext: '.png',
  mime: 'image/png',
  size: 1.0,
  url: 'url',
  previewUrl: null,
);

void main() {
  test('fetchServices updates status and list', () async {
    final notifier = ServicesNotifier(api: FakeApi([_buildService()]));
    await notifier.fetchServices();

    expect(notifier.status, ServiceStatus.success);
    expect(notifier.services.length, 1);
  });
}
