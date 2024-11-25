import '../Models/CuaHang.dart';
import '../Models/DienThoai.dart';
import '../Models/HoaDon.dart';

class Testbai {
  void run() {
    //1. Tạo và quản lý thông tin điện thoại
    print("------- Quản lý thông tin điện thoại -------");
    var cuaHang = cuaHangDT ("20 An Dương Vương", "Cellphone SS");

    // Thêm điện thoại
    var dt1 = DienThoai(15000000, 12000000, "Apple", "DT-001", 50, "iPhone 17", true);
    var dt2 = DienThoai(20000000, 18000000, "Samsung", "DT-002", 30, "Samsung Galaxy S23", true);

    cuaHang.themDienThoai(dt1);
    cuaHang.themDienThoai(dt2);

    // Cập nhật thông tin
    var thongTinMoi = DienThoai(14000000, 11000000, "Apple", "DT-001", 40, "iPhone 14 Pro", true);
    cuaHang.capNhatDienThoai("DT-001", thongTinMoi);

    // Kiểm tra validation
    try {
      var invalidDT = DienThoai(0, 0, "", "DT-999", -10, "", false);
      cuaHang.themDienThoai(invalidDT);
    } catch (e) {
      print("Lỗi khi thêm điện thoại không hợp lệ: $e");
    }

    cuaHang.hienThiDanhSachDienThoai();

    // 2. Tạo và quản lý hóa đơn
    print("\n----- Quản lý hóa đơn -----");

    var hoaDon1 = HoaDon(dt1, 15500000, "HD-001", DateTime.now(), "0901234567",
        5, "Nguyễn Văn A");
    var hoaDon2 = HoaDon(
        dt2, 20500000, "HD-002", DateTime.now(), "0912345678", 3, "Trần Thị B");

    cuaHang.taoHoaDon(hoaDon1);
    cuaHang.taoHoaDon(hoaDon2);

    try {
      var hoaDonInvalid = HoaDon(dt1, 15000000, "HD-003", DateTime.now(),
          "0987654321", 100, "Lê Văn C");
      cuaHang.taoHoaDon(hoaDonInvalid);
    } catch (e) {
      print("Lỗi khi tạo hóa đơn không hợp lệ: $e");
    }

    cuaHang.hienThiDanhSachHoaDon();

    // Tính toán tiền và lợi nhuận
    print(
        "\nTổng doanh thu: ${cuaHang.tinhTongDoanhThu(DateTime(2024, 1, 1), DateTime.now())}");
    print(
        "Tổng lợi nhuận: ${cuaHang.tinhTongLoiNhuan(DateTime(2024, 1, 1), DateTime.now())}");

    // 3. Thống kê báo cáo
    print("\n===== Thống kê báo cáo =====");

    // Doanh thu theo thời gian
    double doanhThu =
        cuaHang.tinhTongDoanhThu(DateTime(2024, 1, 1), DateTime.now());
    print("Doanh thu từ 01/2024 đến hiện tại: $doanhThu");

    // Lợi nhuận theo thời gian
    double loiNhuan =
        cuaHang.tinhTongLoiNhuan(DateTime(2024, 1, 1), DateTime.now());
    print("Lợi nhuận từ 01/2024 đến hiện tại: $loiNhuan");

    // Top bán chạy
    var topBanChay = cuaHang.thongKeTopDienThoaiBanChay();
    print("\nTop điện thoại bán chạy:");
    for (var dt in topBanChay) {
      print("${dt.tenDT} - Số lượng bán: ${dt.slTonkho}");
    }

    // Báo cáo tồn kho
    var tonKho = cuaHang.thongKeTonKho();
    print("\nBáo cáo tồn kho:");
    for (var dt in tonKho) {
      print("${dt.tenDT} - Số lượng tồn kho: ${dt.slTonkho}");
    }
  }
}

void main() {
  var test = Testbai();
  test.run();
}