<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

## tckn_check
Flutter için TCKN (TC Kimlik No) kontrolü yapan package projesi.

## TC Kimlik No Doğrulama Algoritması

- Kural-1: Tüm karakterleri rakam olmalıdır.
- Kural-2: TC Kimlik numarası 11 basamaktan oluşmalıdır.
- Kural-3: İlk hanesi 0 olamaz.
- Kural-4: İlk 9 basamak arasındaki algoritma, 10. basmağı vermelidir.
- İşlem: 1. 3. 5. 7. ve 9. hanelerin toplamının 7 katından, 2. 4. 6. ve 8. hanelerin toplamı çıkartıldığında, elde edilen sonucun 10′a bölümünden kalan, yani Mod10′u bize 10. haneyi verir.
- Kural-5: İlk 10 basamak arasındaki algoritma, 11. basamağı vermelidir.
- İşlem: 1. 2. 3. 4. 5. 6. 7. 8. 9. ve 10. hanelerin toplamından elde edilen sonucun 10′a bölümünden (Mod 10) kalan, bize 11. haneyi verir.

## Kullanımı

pubspec.yaml içerisine aşağıdaki şekilde ekleyin.

```xml
dependencies:
  tckn_check:
    git: https://github.com/egemenmede/tckn_check.git
```
