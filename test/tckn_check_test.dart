import 'package:flutter_test/flutter_test.dart';

import 'package:tckn_check/tckn_check.dart';

void main() {
  test('geçerli tckn bilgisinin girilmesi', () {
    final tckn = Tckn();
    expect(tckn.check("29482514386"), true);
  });

  test('kural-1 ihlali', () {
    final tckn = Tckn();
    expect(tckn.check("2A482514386"), false);
  });

  test('kural-2 ihlali', () {
    final tckn = Tckn();
    expect(tckn.check("9482514386"), false);
  });

  test('kural-4 ihlali', () {
    final tckn = Tckn();
    expect(tckn.check("28482514386"), false);
  });

  test('kural-5 ihlali', () {
    final tckn = Tckn();
    expect(tckn.check("28482514386"), false);
  });


}
