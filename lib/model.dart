class User {
  final int id;
  final String maNhanVien;
  final String matKhau;

  const User({
    required this.id,
    required this.maNhanVien,
    required this.matKhau,
  });

  const User.empty({
    this.id = 0,
    this.maNhanVien = '',
    this.matKhau = '',
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        maNhanVien: json['maNhanVien'],
        matKhau: json['matKhau'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "maNhanVien": maNhanVien,
        "matKhau": matKhau,
      };
}