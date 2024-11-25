import '../Models/DienThoai.dart';
import '../Models/HoaDon.dart';

class cuaHangDT {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhsachDT = [];
  List<HoaDon> _danhsachHD = [];

  //Constructor
  cuaHangDT(this._tenCuaHang, this._diaChi);

  //Getters
  String get tenCuaHang => _tenCuaHang;
  String get diaChi => _diaChi;

  //Chức năng của điện thoại
  void themDienThoai(DienThoai dt) {
    _danhsachDT.add(dt);
    print("đã thêm điện thoại: ${dt.tenDT}");
  }

  void capNhatDienThoai(String maDT, DienThoai thongTinMoi) {
    //tìm phần tử đầu tiên trong ds thoả mãn đkien
    var dt = _danhsachDT.firstWhere(
      (dt) => dt.maDT == maDT,
      orElse: () => throw Exception("Không tìm thấy điện thoại với mã $maDT"),
    );
    dt
      ..tenDT = thongTinMoi.tenDT
      ..hangSX = thongTinMoi.hangSX
      ..giaNhap = thongTinMoi.giaNhap
      ..giaBan = thongTinMoi.giaBan
      ..slTonkho = thongTinMoi.slTonkho;
    print("Đã cập nhật thông tin cho điện thoại mã $maDT.");
  }

  void ngungKinhDoanhDT(String maDT) {
    //tìm phần tử đầu tiên trong ds thoả mãn đkien
    var dt = _danhsachDT.firstWhere(
      (dt) => dt.maDT == maDT,
      orElse: () => throw Exception("Không tìm thấy điện thoại với mã $maDT"),
    );
    dt.slTonkho = 0;
    print("Đã ngừng kinh doanh điện thoại mã $maDT.");
  }

  List<DienThoai> timKiemDienThoai({String? ma, String? ten, String? hang}) {
    return _danhsachDT.where((dt) {
      bool matchMa = ma == null || dt.maDT.contains(ma);
      bool matchTen = ten == null ||
          dt.tenDT.toLowerCase().contains(ten
              .toLowerCase()); //toLowerCase(): Để tìm kiếm không phân biệt chữ hoa và chữ thường.
      bool matchHang =
          hang == null || dt.hangSX.toLowerCase().contains(hang.toLowerCase());
      return matchMa && matchTen && matchHang;
    }).toList();
  }

  void hienThiDanhSachDienThoai() {
    print("Danh sách điện thoại:");
    _danhsachDT.forEach((dt) {
      dt.hienThiThongTin();
      print('---');
    });
  }

  //Chức năng hóa đơn
  void taoHoaDon(HoaDon hoaDon) {
    if (hoaDon.dienThoai.slTonkho >= hoaDon.slMua) {
      hoaDon.dienThoai.slTonkho -= hoaDon.slMua;
      _danhsachHD.add(hoaDon);
      print("Đã tạo hóa đơn: ${hoaDon.maHD}");
    } else {
      throw Exception("Không đủ tồn kho để tạo hóa đơn.");
    }
    List<HoaDon> timKiemHoaDon(
        {String? ma, DateTime? ngay, String? tenKhachHang}) {
      return _danhsachHD.where((hd) {
        bool matchMa = ma == null || hd.maHD.contains(ma);
        bool matchNgay = ngay == null ||
            hd.ngayBan.day == ngay.day &&
                hd.ngayBan.month == ngay.month &&
                hd.ngayBan.year == ngay.year;
        bool matchKhach = tenKhachHang == null ||
            hd.tenKH.toLowerCase().contains(tenKhachHang.toLowerCase());
        return matchMa && matchNgay && matchKhach;
      }).toList();
    }
  }

  void hienThiDanhSachHoaDon() {
    print("Danh sách hóa đơn:");
    _danhsachHD.forEach((hd) {
      hd.hienThiThongTin();
      print('---');
    });
  }

  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    return _danhsachHD.where((hd) {
      return hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay);
    }).fold(
        0,
        (tong, hd) =>
            tong +
            hd.tinhTongTien()); //.fold trong Dart là một cách để tích lũy giá trị từ một danh sách.
  }

  double tinhTongLoiNhuan(DateTime tuNgay, DateTime denNgay) {
    return _danhsachHD.where((hd) {
      return hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay);
    }).fold(
        0,
        (tong, hd) =>
            tong +
            hd.tinhLoiNhuanThucTe()); //.fold trong Dart là một cách để tích lũy giá trị từ một danh sách.
  }

  List<DienThoai> thongKeTopDienThoaiBanChay() {
    var banChay = <DienThoai, int>{};
    for (var hd in _danhsachHD) {
      banChay[hd.dienThoai] = (banChay[hd.dienThoai] ?? 0) + hd.slMua;
    }
    var sorted = banChay.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return sorted.map((e) => e.key).toList();
  }

  List<DienThoai> thongKeTonKho() {
    return _danhsachDT.where((dt) => dt.slTonkho > 0).toList();
  }
}