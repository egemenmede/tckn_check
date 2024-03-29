import 'package:flutter_test/flutter_test.dart';

import 'package:tckn_check/tckn_check.dart';

void main() {
  test('empty kontrolu', () {
    final tckn = Tckn();
    expect(tckn.check(""), false);
  });

  test('bosluk kontrolu 2', () {
    final tckn = Tckn();
    expect(tckn.check(" "), false);
  });

  test('geçerli tckn bilgisinin girilmesi', () {
    final tckn = Tckn();
    expect(tckn.check("62468678658"), true);
  });

  test('geçersiz tckn: kural-1 ihlali', () {
    final tckn = Tckn();
    expect(tckn.check("6A468678658"), false);
  });

  test('geçersiz tckn: kural-2 ihlali', () {
    final tckn = Tckn();
    expect(tckn.check("6468678658"), false);
  });

  test('geçersiz tckn: kural-4 ihlali', () {
    final tckn = Tckn();
    expect(tckn.check("61468678658"), false);
  });

  test('geçersiz tckn: kural-5 ihlali', () {
    final tckn = Tckn();
    expect(tckn.check("61468678658"), false);
  });
}
