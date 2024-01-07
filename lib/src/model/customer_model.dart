
class CustomerModel {
  final String email;
  final String password;
  final String name;
  final String imagePath;

  CustomerModel({
    required this.email,
    required this.password,
    required this.name,
    required this.imagePath,
  });
}
List<CustomerModel> customerList = [
  CustomerModel(
    email: 'pairaw@gmail.com',
    password: '1234',
    name: 'Customer 1',
    imagePath: '',
  ),
];