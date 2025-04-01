import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:cinemapedia_app/main.dart'; // MainApp

void main() {
  // Cargar dotenv antes de cualquier test
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(
        fileName: '.env'); // Asegúrate de que exista este archivo en test env
  });

  testWidgets('1️⃣ MainApp se renderiza correctamente con dotenv cargado',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: MainApp()),
    );
    await tester.pumpAndSettle();

    // Verifica que MaterialApp está presente
    expect(find.byType(MaterialApp), findsOneWidget);

    // Verifica que dotenv se haya cargado correctamente
    expect(
        dotenv.env['TMDB_KEY'] != null, true); // o cualquier variable que uses
  });

  testWidgets('2️⃣ MainApp carga correctamente el tema desde el provider',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: MainApp()),
    );
    await tester.pumpAndSettle();

    final MaterialApp app = tester.widget(find.byType(MaterialApp));

    // Validar que el tema tiene ciertas características (esto depende de tu app_theme.dart)
    expect(app.theme?.brightness, Brightness.dark); // o Brightness.light
    expect(app.theme?.useMaterial3, true); // si usas Material3
  });

  testWidgets('3️⃣ MainApp carga rutas con MaterialApp.router',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: MainApp()),
    );
    await tester.pumpAndSettle();

    // Verifica que esté usando rutas y se haya renderizado alguna pantalla (Scaffold)
    expect(find.byType(Scaffold), findsAtLeastNWidgets(1));

    // Si conoces el contenido de la HomeRoute o la inicial, puedes hacer:
    // expect(find.text('Popular'), findsOneWidget); // si una pestaña o título incluye ese texto
  });
}
