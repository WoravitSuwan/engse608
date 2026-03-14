import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_666/main.dart';

void main() {

  testWidgets('App loads', (WidgetTester tester) async {

    await tester.pumpWidget(const FruitNotesApp());

    expect(find.text('Fruit Notes'), findsOneWidget);

  });

}