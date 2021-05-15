class Kamus {
  final String id_kamus;
  final String nama;
  final String pengertian;

  Kamus({this.id_kamus, this.nama, this.pengertian});

  factory Kamus.formJson(Map <String, dynamic> json){
    return new Kamus(
       id_kamus: json["id_kamus"],
       nama: json['nama'],
       pengertian: json['pengertian'],
    );
  }
}