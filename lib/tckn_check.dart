library tckn_check;

/**
    TC Kimlik No Doğrulama Algoritması
    Kural-1: Tüm karakterleri rakam olmalıdır.
    Kural-2: TC Kimlik numarası 11 basamaktan oluşmalıdır.
    Kural-3: İlk hanesi 0 olamaz.
    Kural-4: İlk 9 basamak arasındaki algoritma, 10. basamağı vermelidir.
    İşlem: 1. 3. 5. 7. ve 9. hanelerin toplamının 7 katından, 2. 4. 6. ve 8. hanelerin toplamı çıkartıldığında, elde edilen sonucun 10′a bölümünden kalan, yani Mod10′u bize 10. haneyi verir.
    Kural-5: İlk 10 basamak arasındaki algoritma, 11. basamağı vermelidir.
    İşlem: 1. 2. 3. 4. 5. 6. 7. 8. 9. ve 10. hanelerin toplamından elde edilen sonucun 10′a bölümünden (Mod 10) kalan, bize 11. haneyi verir.
*/

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;

  bool checkTCKN(int value) {
    // Kural-1: Tüm karakterleri rakam olmalıdır.
    if (value.isNaN) return false;

    //Kural-2: TC Kimlik numarası 11 basamaktan oluşmalıdır.
    if (value.toString().length >= 11) return false;

    return true;
  }

  // Kullanıcı arayüzünde girilmiş olan TCKN'nin List tipine dönüştürür. Utility metodudur.
  List getTcknCharList(String val){
    var tcknCharList = [];
    for (int i = 0; i < val.toString().length; i++) {
      tcknCharList.add(val.substring(i,i+1));
    }
    return tcknCharList;
  }

}
