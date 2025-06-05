import 'package:dio/dio.dart';
import 'package:services_app/models/service_model.dart';

class Api {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://acceptable-eggs-0ba2b16280.strapiapp.com/api',
    ),
  );

  Future<List<ServiceModel>> getServices() async {
    try {
      final response = await _dio.get(
        '/services',
        queryParameters: {'populate': '*'},
      );
      final List<dynamic> data = response.data['data'];
      return data
          .map((item) => ServiceModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (err) {
      throw Exception('Error fetching services: $err');
    }
  }

  Future<void> createTicket({
    required String name,
    required String address,
    required DateTime date,
    String? comment,
    required String serviceDocumentId,
  }) async {
    try {
      await _dio.post(
        '/tickets',
        data: {
          'data': {
            'name': name,
            'address': address,
            'date': date.toUtc().toIso8601String(),
            'comment': comment,
            'service': serviceDocumentId,
          },
        },
      );
    } catch (err) {
      throw Exception('Error creating ticket: $err');
    }
  }
}
