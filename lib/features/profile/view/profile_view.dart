import 'package:ecommerce/widgets/app_button.dart';

import '../../../core.dart';
import '../../../data/services/auth_service.dart';
import '../../../widgets/app_textfield.dart';
import 'components/profile_menu.dart';
import 'components/profile_pic.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "Profile",
              icon: "",
              press: () {
                isEdit = !isEdit;
                setState(() {});
              },
            ),
            Visibility(
              visible: isEdit,
              child: Form(
                key: _formKey,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AppTextField(
                        controller: _emailController,
                        hintText: 'Email',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AppTextField(
                        controller: _firstNameController,
                        hintText: 'Password',
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AppTextField(
                        controller: _lastNameController,
                        hintText: 'First Name',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {

                          }
                        },
                        child: Text(
                          'Save & Submit',
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "",
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "",
              press: () {
                final authService =
                    Provider.of<AuthService>(context, listen: false);
                authService.remove().then((value) {
                  Navigator.pushReplacementNamed(context, RoutesName.loginView);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
