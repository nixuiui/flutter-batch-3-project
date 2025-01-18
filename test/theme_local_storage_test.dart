import 'package:flutter/material.dart';
import 'package:flutter_batch_3_project/data/local_storage/theme_local_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'theme_local_storage_test.mocks.dart';

@GenerateMocks([Box])
void main() {

  late MockBox mockBox;
  late ThemeLocalStorage themeLocalStorage;

  setUp(() {
    mockBox = MockBox();
    themeLocalStorage = ThemeLocalStorage(mockBox);
  });

  group("ThemeLocalStorage", () {
    test("theme return ThemeMode.dark when value is 'dark'", () {
      when(mockBox.get("theme")).thenReturn("dark");
      final themeMode = themeLocalStorage.theme;
      expect(themeMode, ThemeMode.dark);
    });

    test("theme return ThemeMode.light when value is 'light'", () {
      when(mockBox.get("theme")).thenReturn("light");
      final themeMode = themeLocalStorage.theme;
      expect(themeMode, ThemeMode.light);
    });

    test("theme return ThemeMode.system when value is 'null'", () {
      when(mockBox.get("theme")).thenReturn(null);
      final themeMode = themeLocalStorage.theme;
      expect(themeMode, ThemeMode.system);
    });

    test("Save the 'light' value when the input is ThemeMode.light", () async {
      await themeLocalStorage.setTheme(ThemeMode.light);
      verify(mockBox.put("theme", "light"));
    });

    test("Save the 'dark' value when the input is ThemeMode.dark", () async {
      await themeLocalStorage.setTheme(ThemeMode.dark);
      verify(mockBox.put("theme", "dark"));
    });
  });

}