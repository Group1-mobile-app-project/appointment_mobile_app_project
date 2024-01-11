class Barber {
  final String uid;
  final String? email;
  final String? password;
  final String? role;
  final int phoneNumber;
  final String address;
  final String name;
  final String imagePath;
  Barber({
    required this.uid,
    required this.name,
    required this.phoneNumber,
    required this.address,
    this.email,
    this.password,
    required this.role,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'UID' : uid,
      'Name': name,
      'Phone Number': phoneNumber,
      'Address': address,
      'role': role,
      'imagePath': imagePath,
    };
  }
}
