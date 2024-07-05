class HospitalModel {
  String? city;
  String? district;
  String? specialty;
  String? name;
  String? address;
  String? phone;
  String? image;
  String? time;

  HospitalModel({
    this.city,
    this.district,
    this.specialty,
    this.name,
    this.address,
    this.phone,
    this.image,
    this.time,
  });

  factory HospitalModel.fromJson(Map<String, dynamic> json) {
    return HospitalModel(
      city: json['city'] as String?,
      district: json['district'] as String?,
      specialty: json['specialty'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      image: json['image'] as String?,
      time: json['time'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'city': city,
        'district': district,
        'specialty': specialty,
        'name': name,
        'address': address,
        'phone': phone,
        'image': image,
        'time': time,
      };
}
