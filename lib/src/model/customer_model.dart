class CustomerModel {
  final String? email;
  final String? password;
  final String? role;
  final int phoneNumber;
  final String name;
  final String imagePath;

  CustomerModel({
required this.name,
    required this.phoneNumber,
    this.email,
    this.password,
    required this.role,
    required this.imagePath,
  });


 Map<String, dynamic> toMap() {
    return {
      'Name': name,
      'Phone Number': phoneNumber,
      'role': role,
      'imagePath': imagePath,
    };
  }
}
