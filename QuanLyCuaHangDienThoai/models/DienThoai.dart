class DienThoai {
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTonKho;
  bool _trangThai;

  //Constructors
  DienThoai(this._giaBan, this._giaNhap, this._hangSanXuat, this._maDienThoai, this._soLuongTonKho, this._tenDienThoai, this._trangThai);

  //Getters
  String get maDT => _maDienThoai;
  String get tenDT => _tenDienThoai;
  String get hangSX => _hangSanXuat;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get slTonkho => _soLuongTonKho;
  bool get trangThai => _trangThai;

  //Setters
  set maDT(String maDT) {
    if (maDT.isNotEmpty && RegExp(r'^DT-\d{3}$').hasMatch(maDT)) {
      _maDienThoai = maDT;
    } else {
      throw ArgumentError(
          "Mã điện thoại không hợp lệ! Phải có định dạng 'DT-XXX'.");
    }
  }

  set tenDT(String tenDT) {
    if (tenDT.isNotEmpty) {
      _tenDienThoai = tenDT;
    } else {
      throw ArgumentError("Tên điện thoại không được rỗng.");
    }
  }

  set hangSX(String hangSX) {
    if (hangSX.isNotEmpty) {
      _hangSanXuat = hangSX;
    } else {
      throw ArgumentError("Hãng sản xuất không được rỗng.");
    }
  }

  set giaNhap(double giaNhap) {
    if (giaNhap > 0) {
      _giaNhap = giaNhap;
    } else {
      throw ArgumentError("Giá nhập phải lớn hơn 0.");
    }
  }

  set giaBan(double giaBan) {
    if (giaBan > 0 && giaBan > _giaNhap) {
      _giaBan = giaBan;
    } else {
      throw ArgumentError("Giá bán phải lớn hơn giá nhập và lớn hơn 0.");
    }
  }

  set slTonkho(int slTonkho) {
    if (slTonkho >= 0) {
      _soLuongTonKho = slTonkho;
    } else {
      throw ArgumentError("Số lượng tồn kho phải lớn hơn hoặc bằng 0.");
    }
  }

  set trangThai(bool trangThai) {}

  //Hiển thị thông tin
  void hienThiThongTin() {
    print("Mã điện thoại: $_maDienThoai");
    print("Tên điện thoại: $_tenDienThoai");
    print("Hãng sản xuất: $_hangSanXuat");
    print("Giá nhập: $_giaNhap");
    print("Giá bán: $_giaBan");
    print("Số lượng tồn kho: $_soLuongTonKho");
    print("Trạng thái: ${_trangThai ? "Còn kinh doanh" : "Ngừng kinh doanh"}");
  }

  //Tính lợi nhuận dự kiến
  double tinhLoiNhuan() {
    return _giaBan - _giaNhap;
  }

  //Kiểm tra có thể bán không
  bool coTheBan() {
    return _soLuongTonKho > 0 && _trangThai;
  }
}