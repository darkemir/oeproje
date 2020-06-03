import 'package:endustrigiristesti/main.dart';

import 'soruyaraticisi.dart';

class SorularIslemler {
  int _soruNo = 0;
  List<Sorular> _sorubankasi = [
    Sorular(
        'Endüstri Mühendisliği; insan, makine, bilişim, donanım ve enerjiden oluşan bütünleşik sistemlerin tasarımı, iyileştirilmesi ve kurulması ile ilgilenir.',
        CevapSecenegi.dogru),
    Sorular(
        'Ürün malzeme standartlarını geliştirmek Endüstri Mühendisinin işidir',
        CevapSecenegi.yanlis),
    Sorular(
        'Üretim faaliyetlerini hızlandırmak için iş akışı çizelgelerini belirlenen üretim sıralarına ve teslimat sürelerine göre düzenlemek.',
        CevapSecenegi.dogru),
    Sorular(
        'Endüstri mühendisi, üst düzey bilgisayar kullanım bilgisine sahip olmalıdır',
        CevapSecenegi.yanlis)
  ];
  void sonrakiSoru() {
    if (_soruNo < _sorubankasi.length - 1) {
      _soruNo++;
    }
  }

  String soruyuGoster() {
    return _sorubankasi[_soruNo].soruIcerigi;
  }

  CevapSecenegi dogruCevabial() {
    return _sorubankasi[_soruNo].cevap;
  }

  void reset() {
    _soruNo = 0;
  }

  bool bittiMi() {
    if (_soruNo == _sorubankasi.length - 1) {
      return true;
    } else {
      return false;
    }
  }
}
