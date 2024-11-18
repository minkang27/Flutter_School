class SinhVien{
  String _hoTen;
  int _tuoi;
  String _maSV;
  double _diemTB;

  //Constructor
  SinhVien(this._hoTen,this._tuoi,this._maSV,this._diemTB);

  //Getters
  String get hoTen => _hoTen;
  int get tuoi => _tuoi;
  String get maSV => _maSV;
  double get diem => _diemTB;

  //Setters
  set hoTen(String hoTen){
    if (hoTen.isNotEmpty){
      _hoTen = hoTen;
    }
  }
  set tuoi(int tuoi){
      _tuoi = (tuoi>0 ?tuoi :_tuoi);

  }
   set maSV(String maSV){
    if (maSV.isNotEmpty){
      _maSV = maSV;
    }
  }

  set diemTB(double diemTB){
    if (diemTB >=0 || diemTB <=10){
      _diemTB = diemTB;
    }
  }

  void hienThiThongTin(){
    print('Họ ten: $_hoTen');
    print('Tuổi: $_tuoi');
    print('Mã số sinh viên: $_maSV');
  }

  String xepLoai(){
    if (_diemTB >= 8.0) return 'Giỏi';
    if (_diemTB >= 6.5) return 'Khá';
    if (_diemTB >= 5.0) return 'Trung bình';
    return 'Yếu';
  }
}

class LopHoc{
  String _tenLop;
  List<SinhVien> _danhSachSV =[];

  LopHoc(this._tenLop);

  //Getter
  String get tenLop => _tenLop;
  List<SinhVien> get danhSachSV => _danhSachSV;

  //Setters
  set tenLop(String tenLop){
    if (tenLop.isNotEmpty){
      _tenLop = tenLop;
    }
  }
  void  themSinhVien (SinhVien sv) => _danhSachSV.add(sv);
 
  void hienThiDanhSach(){
    print('\nDanh sách sinh viên lớp $_tenLop');
    for (var sv in _danhSachSV){
      sv.hienThiThongTin();
      print('\Xếp loại: ${sv.xepLoai()}');

    }
  }
}


 //Test
  void main(){
    var sv = SinhVien('Nguyen Van Ba',21,'SV001',8.3);
    print('Test getter: ${sv.hoTen}' );
    sv.hoTen = 'Nguyen Van Tu';
    print('After set: ${sv.hoTen}');
    print('Xep loai: ${sv.xepLoai()}');
   
   var lop= LopHoc('21DTHD5');
   lop.themSinhVien(SinhVien('Nguyen Van Mot', 70, 'SV001', 8.5));
   lop.themSinhVien(SinhVien('Nguyen Van Hai', 10, 'SV002', 10));
   lop.themSinhVien(SinhVien('Nguyen Van Ba', 10, 'SV003', 5.0));
   lop.themSinhVien(SinhVien('Nguyen Van Tu', 21, 'SV004', 4.0));
   lop.hienThiDanhSach();

  }