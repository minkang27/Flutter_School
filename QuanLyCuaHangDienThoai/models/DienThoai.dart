class DienThoai{
  String _maDT;
  String _tenDT;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuong;
  bool _trangThai;

  DienThoai(this._maDT, this._tenDT, this._hangSanXuat, this._giaNhap, this._giaBan, this._soLuong, this._trangThai)
  {
    // Validation trong constructor
    if (!_maDT.startsWith("DT-")) {
      throw Exception("Mã điện thoại phải có định dạng 'DT-XXX'");
    }
    if (_maDT.isEmpty) {
      throw Exception("Mã điện thoại không được rỗng");
    }
    if (_tenDT.isEmpty) {
      throw Exception("Tên điện thoại không được rỗng");
    }
    if (_hangSanXuat.isEmpty) {
      throw Exception("Hãng sản xuất không được rỗng");
    }
    if (_giaNhap <= 0) {
      throw Exception("Giá nhập phải lớn hơn 0");
    }
    if (_giaBan <= _giaNhap) {
      throw Exception("Giá bán phải lớn hơn giá nhập");
    }
    if (_soLuong < 0) {
      throw Exception("Số lượng tồn kho phải >= 0");
    }
  }

  //getter 
  String get maDT => _maDT;
  String get tenDT => _tenDT;
  String get hangSanXuat => _hangSanXuat;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get soLuong => _soLuong;
  bool get trangThai => _trangThai;


  //setter 
  set maDT(String maDT){
    if(maDT.isNotEmpty || maDT.startsWith("DT-")){
      throw Exception("Mã điện thoại phải có định dạng 'DT-XXX' và không được rỗng");
    }
    _maDT = maDT;
  }

  set tenDT(String tenDT) {
    if (tenDT.isEmpty) {
      throw Exception("Tên điện thoại không được rỗng");
    }
    _tenDT = tenDT;
  }

  set hangSanXuat(String hangSanXuat) {
    if (hangSanXuat.isEmpty) {
      throw Exception("Hãng sản xuất không được rỗng");
    }
    _hangSanXuat = hangSanXuat;
  }

  set giaNhap(double giaNhap) {
    if (giaNhap <= 0) {
      throw Exception("Giá nhập phải lớn hơn 0");
    }
    _giaNhap = giaNhap;
  }

  set giaBan(double giaBan) {
    if (giaBan <= _giaNhap) {
      throw Exception("Giá bán phải lớn hơn giá nhập");
    }
    _giaBan = giaBan;
  }

  set soLuong(int soLuong) {
    if (soLuong < 0) {
      throw Exception("Số lượng tồn kho phải >= 0");
    }
    _soLuong = soLuong;
  }

  set trangThai(bool trangThai) {
    _trangThai = trangThai;
  }

  // Phương thức tính lợi nhuận dự kiến
  double tinhLoiNhuan() {
    return (_giaBan - _giaNhap) * _soLuong;
  }

  // Phương thức hiển thị thông tin
  void hienThiThongTin() {
    print("Mã điện thoại: $_maDT");
    print("Tên điện thoại: $_tenDT");
    print("Hãng sản xuất: $_hangSanXuat");
    print("Giá nhập: $_giaNhap");
    print("Giá bán: $_giaBan");
    print("Số lượng tồn kho: $_soLuong");
    print("Trạng thái: ${_trangThai ? 'Còn kinh doanh' : 'Ngừng kinh doanh'}");
  }

  // Phương thức kiểm tra có thể bán không
  bool coTheBan() {
    return _trangThai && _soLuong > 0;
  }
}

void main() {
  try {
    // Tạo đối tượng mẫu
    DienThoai dt = DienThoai("DT-001", "iPhone 15", "Apple", 20000000, 25000000, 10, true);
    
    // Hiển thị thông tin
    dt.hienThiThongTin();
    
    // Tính lợi nhuận
    print("Lợi nhuận dự kiến: ${dt.tinhLoiNhuan()}");

    // Kiểm tra có thể bán không
    print("Có thể bán: ${dt.coTheBan()}");
  } catch (e) {
    print("Lỗi: $e");
  }

}