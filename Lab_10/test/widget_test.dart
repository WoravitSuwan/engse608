import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:lab10/main.dart';

void main() {

  testWidgets('First Shop loads successfully', (WidgetTester tester) async {

    await tester.pumpWidget(const FirstShopApp());

    expect(find.byType(MaterialApp), findsOneWidget);

  });

}