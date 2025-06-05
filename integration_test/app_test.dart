import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:services_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App starts and shows home', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.text('Servicios'), findsOneWidget);
  });
}
