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
 factory Barber.fromMap(Map<String, dynamic> map) {
    return Barber(
      uid: map['UID'] ?? '',
      name: map['Name'] ?? '',
      phoneNumber: map['Phone Number'] ?? 0,
      address: map['Address'] ?? '',
      email: map['email'],
      password: map['password'],
      role: map['role'],
      imagePath: map['imagePath'] ?? '',
    );
  }

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
