import 'package:flutter/material.dart';
import 'package:services_app/models/ticket_model.dart';
import 'package:services_app/services/api.dart';

enum TicketStatus { idle, loading, success, error }

class TicketNotifier with ChangeNotifier {
  TicketStatus _status = TicketStatus.idle;
  TicketStatus get status => _status;

  TicketModel? _ticketScanned;

  TicketModel? get tickerScanned => _ticketScanned;

  set status(TicketStatus value) {
    _status = value;
    notifyListeners();
  }

  Future<void> createTicket({
    required String name,
    required String address,
    required DateTime date,
    String? comment,
    required String serviceDocumentId,
  }) async {
    try {
      _status = TicketStatus.loading;
      notifyListeners();
      await Api().createTicket(
        name: name,
        address: address,
        date: date,
        comment: comment,
        serviceDocumentId: serviceDocumentId,
      );
      _status = TicketStatus.success;
    } catch (_) {
      _status = TicketStatus.error;
      rethrow;
    } finally {
      notifyListeners();
    }
  }

  Future<void> scannTicket(String id) async {
    try {
      _status = TicketStatus.loading;
      notifyListeners();
      _ticketScanned = await Api().getTicket(id);
    } catch (err) {
      _ticketScanned = null;
      _status = TicketStatus.error;
    } finally {
      notifyListeners();
    }
  }
}
