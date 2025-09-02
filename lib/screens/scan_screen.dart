import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:services_app/notifiers/ticket_notifier.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  static const String routeName = "/scan-screen";

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (!mounted) return;
      context.read<TicketNotifier>().status = TicketStatus.idle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Validar Reserva")),
      body: Consumer<TicketNotifier>(
        builder: (context, notifier, _) {
          if (notifier.status == TicketStatus.idle) {
            return Center(child: Text("Escanea un QR"));
          }
          if (notifier.status == TicketStatus.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (notifier.status == TicketStatus.error) {
            return Center(child: Text("Ha ocurrido un error"));
          }
          return Column(
            children: [
              Text("Nombre: ${notifier.tickerScanned?.name}"),
              Text("Dirección: ${notifier.tickerScanned?.address}"),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AiBarcodeScanner(
                onDetect: (BarcodeCapture capture) {
                  context.read<TicketNotifier>().scannTicket(
                    capture.barcodes.first.rawValue!,
                  );
                  Navigator.of(context).pop();
                },
              ),
            ),
          );
        },
        label: Text("Escanear"),
      ),
    );
  }
}
