import 'DienThoai.dart';

class HoaDon {
  String _maHoaDon;
  DateTime _ngayBan = DateTime.now();
  DienThoai _dienThoai;
  int _soluongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _sdtKhachHang;

  //Constructors
  HoaDon(this._dienThoai, this._giaBanThucTe, this._maHoaDon, this._ngayBan, this._sdtKhachHang, this._soluongMua, this._tenKhachHang);

  //Getters
  String get maHD => _maHoaDon;
  DateTime get ngayBan => _ngayBan;
  DienThoai get dienThoai => _dienThoai;
  int get slMua => _soluongMua;
  double get giaBanThucTe => _giaBanThucTe;
  String get tenKH => _tenKhachHang;
  String get sdtKH => _sdtKhachHang;

  //Setters
  set maHD(String maHD) {
    if (maHD.isNotEmpty && RegExp(r'^HD-\d{3}$').hasMatch(maHD)) {
      _maHoaDon = maHD;
    } else {
      throw ArgumentError("Mã hóa đơn không hợp lệ (phải có dạng 'HD-XXX').");
    }
  }

  set ngayBan(DateTime ngayBan) {
    if (ngayBan.isBefore(DateTime.now()) ||
        ngayBan.isAtSameMomentAs(DateTime.now())) {
      _ngayBan = ngayBan;
    } else {
      throw ArgumentError("Ngày bán không được sau ngày hiện tại.");
    }
  }

  set slMua(int slMua) {
    if (slMua > 0 && slMua <= _dienThoai.slTonkho) {
      _soluongMua = slMua;
    } else {
      throw ArgumentError(
          "Số lượng mua phải lớn hơn 0 và không vượt quá tồn kho.");
    }
  }

  set giaBanThucTe(double giaBanThucTe) {
    if (giaBanThucTe > 0) {
      _giaBanThucTe = giaBanThucTe;
    } else {
      throw ArgumentError("Giá bán thực tế phải lớn hơn 0.");
    }
  }

  set tenKH(String tenKH) {
    if (tenKH.isNotEmpty) {
      _tenKhachHang = tenKH;
    } else {
      throw ArgumentError("Tên khách hàng không được rỗng.");
    }
  }

  set sdtKH(String sdtKH) {
    if (sdtKH.isNotEmpty && RegExp(r'^\d{10,11}$').hasMatch(sdtKH)) {
      _sdtKhachHang = sdtKH;
    } else {
      throw ArgumentError("Số điện thoại khách phải là 10 hoặc 11 chữ số.");
    }
  }

  double tinhTongTien() {
    return _soluongMua * _giaBanThucTe;
  }

  double tinhLoiNhuanThucTe() {
    return tinhTongTien() - (_soluongMua * _dienThoai.giaNhap);
  }

  void hienThiThongTin() {
    print("Mã hóa đơn: $_maHoaDon");
    print("Ngày bán: $_ngayBan");
    print("Tên khách hàng: $_tenKhachHang");
    print("Số điện thoại khách: $_sdtKhachHang");
    print("Điện thoại: ${_dienThoai.tenDT}");
    print("Hãng sản xuất: ${_dienThoai.hangSX}");
    print("Số lượng mua: $_soluongMua");
    print("Giá bán thực tế: $_giaBanThucTe");
    print("Tổng tiền: ${tinhTongTien()}");
    print("Lợi nhuận thực tế: ${tinhLoiNhuanThucTe()}");
  }
}