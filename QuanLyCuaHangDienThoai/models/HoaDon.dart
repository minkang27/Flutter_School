import 'DienThoai.dart';

class HoaDon {
  String _maHoaDon;
  DateTime _NgayBan;
  List<DienThoai> _dthDaban = [];
  int _slMua;
  double _giaBan;
  String _tenKhach;
  String _sdt;

  HoaDon(this._maHoaDon, this._NgayBan, this._slMua, this._tenKhach, this._giaBan, this._sdt) {
    // Validation khi khởi tạo
    if (_maHoaDon.isEmpty || !_maHoaDon.startsWith("HD-")) {
      throw Exception("Mã hóa đơn không hợp lệ (phải theo định dạng 'HD-XXX').");
    }
    if (_NgayBan.isAfter(DateTime.now())) {
      throw Exception("Ngày bán không được sau ngày hiện tại.");
    }
    if (_slMua <= 0) {
      throw Exception("Số lượng mua phải lớn hơn 0.");
    }
    if (_giaBan <= 0) {
      throw Exception("Giá bán phải lớn hơn 0.");
    }
    if (_tenKhach.isEmpty || _sdt.isEmpty) {
      throw Exception("Thông tin khách hàng không được để trống.");
    }
    if (!_isValidPhoneNumber(_sdt)) {
      throw Exception("Số điện thoại không hợp lệ.");
    }
  }

  // Getter
  String get maHoaDon => _maHoaDon;
  DateTime get NgayBan => _NgayBan;
  List<DienThoai> get dthDaban => _dthDaban;
  int get slMua => _slMua;
  double get giaBan => _giaBan;
  String get tenKhach => _tenKhach;
  String get sdt => _sdt;

  // Setter với validation
  set maHoaDon(String maHoaDon) {
    if (maHoaDon.isEmpty || !maHoaDon.startsWith("HD-")) {
      throw Exception("Mã hóa đơn không hợp lệ (phải theo định dạng 'HD-XXX').");
    }
    _maHoaDon = maHoaDon;
  }

  set ngayBan(DateTime ngayBan) {
    if (ngayBan.isAfter(DateTime.now())) {
      throw Exception("Ngày bán không được sau ngày hiện tại.");
    }
    _NgayBan = ngayBan;
  }

  set slMua(int slMua) {
    if (slMua <= 0) {
      throw Exception("Số lượng mua phải lớn hơn 0.");
    }
    _slMua = slMua;
  }

  set giaBan(double giaBan) {
    if (giaBan <= 0) {
      throw Exception("Giá bán phải lớn hơn 0.");
    }
    _giaBan = giaBan;
  }

  set tenKhach(String tenKhach) {
    if (tenKhach.isEmpty) {
      throw Exception("Tên khách hàng không được để trống.");
    }
    _tenKhach = tenKhach;
  }

  set sdt(String sdt) {
    if (!_isValidPhoneNumber(sdt)) {
      throw Exception("Số điện thoại không hợp lệ.");
    }
    _sdt = sdt;
  }

  // Phương thức tính tổng tiền
  double tinhTongTien() {
    return _slMua * _giaBan;
  }

  // Phương thức tính lợi nhuận thực tế (ví dụ: giả định lợi nhuận là 20%)
  double tinhLoiNhuan() {
    return tinhTongTien() * 0.2; // Thay đổi hệ số lợi nhuận tùy yêu cầu
  }

  // Phương thức hiển thị thông tin hóa đơn
  void hienThiThongTin() {
    print("Mã hóa đơn: $_maHoaDon");
    print("Ngày bán: $_NgayBan");
    print("Tên khách hàng: $_tenKhach");
    print("Số điện thoại khách: $_sdt");
    print("Số lượng mua: $_slMua");
    print("Giá bán: $_giaBan");
    print("Tổng tiền: ${tinhTongTien()}");
    print("Lợi nhuận: ${tinhLoiNhuan()}");
  }

  // Hàm kiểm tra số điện thoại hợp lệ
  bool _isValidPhoneNumber(String phoneNumber) {
    final RegExp regex = RegExp(r'^\d{10,11}$');
    return regex.hasMatch(phoneNumber);
  }
}


void main() {
  // Khởi tạo một số đối tượng DienThoai (giả định class DienThoai đã được định nghĩa)
  DienThoai dt = DienThoai("DT-001", "iPhone 15", "Apple", 20000000, 25000000, 10, true);
  DienThoai dt1 = DienThoai("DT-001", "iPhone 15", "Apple", 20000000, 25000000, 10, true);
  // try {
  //   // Tạo một hóa đơn hợp lệ
  //   HoaDon hoaDon = HoaDon(
  //     "HD-001",                       // Mã hóa đơn
  //     DateTime.now(),                // Ngày bán (ngày hiện tại)
  //     2,                             // Số lượng mua
  //     "Nguyễn Văn A",                // Tên khách hàng
  //     18000000,                      // Giá bán
  //     "0987654321"                   // Số điện thoại khách
  //   );

  //   // Thêm sản phẩm đã bán vào danh sách
  //   hoaDon.dthDaban.add(dt);
  //   hoaDon.dthDaban.add(dt1);

  //   // Hiển thị thông tin hóa đơn
  //   print("Thông tin hóa đơn:");
  //   hoaDon.hienThiThongTin();

  //   // Tính toán và hiển thị tổng tiền, lợi nhuận
  //   print("Tổng tiền: ${hoaDon.tinhTongTien()} VND");
  //   print("Lợi nhuận: ${hoaDon.tinhLoiNhuan()} VND");

  //   // Kiểm tra setter với validation
  //   print("\nThay đổi một số thông tin:");
  //   hoaDon.slMua = 3; // Thay đổi số lượng mua
  //   hoaDon.giaBan = 19000000; // Thay đổi giá bán
  //   hoaDon.tenKhach = "Trần Thị B";
  //   hoaDon.sdt = "0912345678";

  //   print("Thông tin hóa đơn sau khi cập nhật:");
  //   hoaDon.hienThiThongTin();
  // } catch (e) {
  //   // Xử lý ngoại lệ nếu có lỗi xảy ra
  //   print("Lỗi: $e");
  // }

  try {
    // Tạo hóa đơn không hợp lệ để kiểm tra validation
    HoaDon hoaDonInvalid = HoaDon(
      "HD-002",                             // Mã hóa đơn không hợp lệ
      DateTime.now().add(Duration(days: 1)), // Ngày bán trong tương lai
      -1,                            // Số lượng mua không hợp lệ
      "",                            // Tên khách hàng trống
      -50000,                        // Giá bán không hợp lệ
      "12345"                        // Số điện thoại không hợp lệ
    );
  } catch (e) {
    // Xử lý ngoại lệ
    print("\nKiểm tra hóa đơn không hợp lệ:");
    print("Lỗi: $e");
  }
}