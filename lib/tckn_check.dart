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

/// TCKN Checker Package
class Tckn {

  final int _chkCount = 10;
  final int _chrCount = 11;

  bool check(String value) {
    bool returnStatus = true;

    // Kural-1: Tüm karakterleri rakam olmalıdır.
    if (value.contains(RegExp(r'[A-Z,a-z,ü,Ü,ö,Ö,ğ,Ğ,i,İ,ç,Ç,ş,Ş]'))) {
      returnStatus = false;
      print("Kural-1: "+ returnStatus.toString());
    }

    //Kural-2: TC Kimlik numarası 11 basamaktan oluşmalıdır.
    if (value.toString().length != 11) {
      returnStatus = false;
      print("Kural-2: "+ returnStatus.toString());
    }

    // Kural-3: İlk hanesi 0 olamaz.
    if (value.toString().substring(0,1) == "0"){
      returnStatus = false;
      print("Kural-3: "+ returnStatus.toString());
    }

    // Kural-4: İlk 9 basamak arasındaki algoritma, 10. basamağı vermelidir.
    if(getRuleFourStatus(value) == false){
      returnStatus = false;
      print("Kural-4: "+ returnStatus.toString());
    }

    // Kural-5: İlk 10 basamak arasındaki algoritma, 11. basamağı vermelidir.
    if(getRuleFiveStatus(value) == false){
      returnStatus = false;
      print("Kural-5: "+ returnStatus.toString());
    }

    print("Kurallar SON: "+ returnStatus.toString());

    return returnStatus;
  }

  // UTILITY: Kullanıcı arayüzünde girilmiş olan TCKN'nin List tipine dönüştürür.
  List getTcknCharList(String val){
    var tcknCharList = [];
    for (int i = 0; i < val.toString().length; i++) {
      tcknCharList.add(val.substring(i,i+1));
    }
    return tcknCharList;
  }

  // UTILITY: TCKN Algoritmasına göre ilk 10 rakamın toplamını int olarak geri döndürür.
  int getTopTenTotal(List tcknCharList){
    int total = 0;
    for (int i = 0; i < _chkCount; i++) {
      total += int.parse(tcknCharList[i].toString());
    }
    return total;
  }

  // UTILITY: TCKN Algoritmasına göre ilk 9 rakamın toplamını String olarak geri döndürür.
  String getFirstNineTotal(List tcknCharList){
    int singleNumberTotal = 0;
    int doubleNumberTotal = 0;

    for (int i = 0; i < 9; i++) {
      if (i % 2 == 0) {
        singleNumberTotal += int.parse(tcknCharList[i].toString());
      }else{ // 2,4,6,8
        doubleNumberTotal += int.parse(tcknCharList[i].toString());
      }
    }

    return (((singleNumberTotal*7)-doubleNumberTotal) % 10).toString();
  }

  // Kural-4 Kontrol Metodu
  bool getRuleFourStatus(String val){
    var tcknCharList = getTcknCharList(val);
    if (tcknCharList.length < _chkCount) return false;

    return getFirstNineTotal(tcknCharList) == tcknCharList[_chkCount-1];
  }

  // Kural-5 Kontrol Metodu
  bool getRuleFiveStatus(String val){
    List tcknCharList = getTcknCharList(val);
    if (tcknCharList.length != _chrCount) return false;

    return (tcknCharList[_chkCount]).toString() == (getTopTenTotal(tcknCharList) % 10).toString();
  }

}
