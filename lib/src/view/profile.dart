import 'package:barberappointmentapp/src/viewmodel/profile_view_model.dart';
import 'package:barberappointmentapp/src/widgets/barber_drawer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);
    profileViewModel.getBarberByUID();
    nameController.text = profileViewModel.barber.name;
    phoneNumberController.text = profileViewModel.barber.phoneNumber.toString();
    addressController.text = profileViewModel.barber.address;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profileViewModel = Provider.of<ProfileViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 182, 172),
      ),
      drawer: const BarberDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    profileViewModel.pickImageAndUpdateState(ImageSource.camera);
                  },
                  child: ClipOval(
                    
                    child: profileViewModel.barber.imagePath != null || profileViewModel.barber.imagePath != ''
                        ? Image.network(profileViewModel.barber.imagePath,fit: BoxFit.cover,height: 250,)
                        : const Icon(
                            Icons.person,
                            size: 50,
                          ),
                  )),
              const SizedBox(
                height: 100,
              ),
              TextField(
                controller: nameController,
                onChanged: (value) => profileViewModel.setName(nameController.text),
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    profileViewModel.setPhonenumber(int.parse(value)),
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: addressController,
                onChanged: (value) => profileViewModel.setAddress(value),
                decoration: const InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await profileViewModel.updateProfile(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 80, 182, 172),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: const Size(380, 60),
                ),
                child: const Text('Upload'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
