import 'package:flutter_test/flutter_test.dart';
import 'package:services_app/models/service_model.dart';

void main() {
  test('ServiceModel.fromJson parses values correctly', () {
    final json = {
      'id': 1,
      'documentId': 'doc1',
      'name': 'Servicio de prueba',
      'description': 'desc',
      'price': 10.5,
      'createdAt': '2024-01-01',
      'updatedAt': '2024-01-02',
      'publishedAt': '2024-01-03',
      'icon': {
        'id': 1,
        'documentId': 'img1',
        'name': 'img.png',
        'width': 100,
        'height': 100,
        'formats': {
          'thumbnail': {
            'ext': '.png',
            'url': 'http://example.com/icon.png',
            'hash': 'hash',
            'mime': 'image/png',
            'name': 'icon',
            'width': 100,
            'height': 100,
            'size': 1.0,
            'sizeInBytes': 1000,
          }
        },
        'hash': 'hash',
        'ext': '.png',
        'mime': 'image/png',
        'size': 1.0,
        'url': 'http://example.com/icon.png',
        'previewUrl': null,
      },
      'banner': {
        'id': 2,
        'documentId': 'img2',
        'name': 'banner.png',
        'width': 200,
        'height': 200,
        'formats': {
          'thumbnail': {
            'ext': '.png',
            'url': 'http://example.com/banner.png',
            'hash': 'hash2',
            'mime': 'image/png',
            'name': 'banner',
            'width': 200,
            'height': 200,
            'size': 2.0,
            'sizeInBytes': 2000,
          }
        },
        'hash': 'hash2',
        'ext': '.png',
        'mime': 'image/png',
        'size': 2.0,
        'url': 'http://example.com/banner.png',
        'previewUrl': null,
      },
    };

    final model = ServiceModel.fromJson(json);

    expect(model.id, 1);
    expect(model.documentId, 'doc1');
    expect(model.name, 'Servicio de prueba');
    expect(model.price, 10.5);
    expect(model.icon.formats['thumbnail']!.url,
        'http://example.com/icon.png');
  });
}
