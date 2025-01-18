import 'package:flutter_batch_3_project/helpers/helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group("formatRupiah()", () {
    test("Return format rupiah untuk bilangan positif", () {
      final result = formatRupiah(100000);
      expect(result, "Rp 100.000");
    });

    test("Return format rupiah untuk value null", () {
      final result = formatRupiah(null);
      expect(result, "Rp 0");
    });

    test("Return format rupiah untuk value 0", () {
      final result = formatRupiah(0);
      expect(result, "Rp 0");
    });

    test("Return format rupiah untuk bilangan negatif", () {
      final result = formatRupiah(-100000);
      expect(result, "-Rp 100.000");
    });
  });

  group("luasSegitiga()", () {
    
    test("menghitung luas dengan alas 10 dan tinggi 20 = 100", () {
      final luas = luasSegitiga(10, 20);
      expect(luas, 100);
    });
    
    test("menghitung luas dengan alas 20 dan tinggi 30 = 300", () {
      final luas = luasSegitiga(20, 30);
      expect(luas, 300);
    });

  });

}