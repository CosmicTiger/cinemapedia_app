import 'package:flutter_test/flutter_test.dart';
import 'package:cinemapedia_app/config/helpers/human_formats.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  setUpAll(() async {
    /// NOTE: This is necessary to initialize the date formatting
    /// for the shortDate method in HumanFormats.
    /// It loads the date formats for the 'en' locale.
    await initializeDateFormatting('en');
  });

  group('🔢 HumanFormats.number()', () {
    test('🔀 turns 1000 a "1K"', () {
      final result = HumanFormats.number(1000);
      expect(result, '1K');
    });

    test('🔀 turns 1500000 a "1.5M" con 1 decimal', () {
      final result = HumanFormats.number(1500000, 1);
      expect(result, '1.5M');
    });

    test('🔀 turns 0 a "0"', () {
      final result = HumanFormats.number(0);
      expect(result, '0');
    });
  });

  group('📅 HumanFormats.shortDate()', () {
    test('⚗️turns DateTime(2023, 10, 15) a "Oct 15, 2023"', () {
      final date = DateTime(2023, 10, 15);
      final result = HumanFormats.shortDate(date);
      expect(result, 'Oct 15, 2023');
    });

    test('⚗️turns DateTime(2024, 1, 1) a "Jan 1, 2024"', () {
      final date = DateTime(2024, 1, 1);
      final result = HumanFormats.shortDate(date);
      expect(result, 'Jan 1, 2024');
    });
  });
}
