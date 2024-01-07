
class Barber {
  final String? email;
  final String? password;
  final String name;
  final String imagePath;

  Barber({
     this.email,
     this.password,
    required this.name,
    required this.imagePath,
  });
}
List<Barber> barberList = [
  Barber(
    email: 'pairaw2@gmail.com',
    password: '12345',
    name: 'Barber 1',
    imagePath: 'https://www.shutterstock.com/image-vector/vintage-barbershop-logo-vector-template-600nw-2179024709.jpg',
  ),
];