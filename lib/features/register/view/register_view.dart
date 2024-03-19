import 'dart:developer';

import 'package:ecommerce/features/register/view_model/register_view_model.dart';
import 'package:ecommerce/widgets/app_button.dart';

import '../../../core.dart';
import '../../../widgets/app_textfield.dart';
import '../model/user_register_model.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _zipcodeController = TextEditingController();
  final TextEditingController _latController = TextEditingController();
  final TextEditingController _longController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var registerViewModel = Provider.of<RegisterViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
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
                    AppTextField(
                      controller: _usernameController,
                      hintText: 'Username',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    AppTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    AppTextField(
                      controller: _firstNameController,
                      hintText: 'First Name',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                    AppTextField(
                      controller: _lastNameController,
                      hintText: 'Last Name',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                    ),
                    AppTextField(
                      controller: _cityController,
                      hintText: 'City',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your city';
                        }
                        return null;
                      },
                    ),
                    AppTextField(
                      controller: _streetController,
                      hintText: 'Street',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your street';
                        }
                        return null;
                      },
                    ),
                    AppTextField(
                      controller: _numberController,
                      hintText: 'Number',
                      textInputType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your number';
                        }
                        return null;
                      },
                    ),
                    AppTextField(
                      controller: _zipcodeController,
                      hintText: 'Zip Code',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your zipcode';
                        }
                        return null;
                      },
                    ),
                    AppTextField(
                      controller: _latController,
                      hintText: 'Latitude',
                      textInputType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter latitude';
                        }
                        return null;
                      },
                    ),
                    AppTextField(
                      controller: _longController,
                      hintText: 'Longitude',
                      textInputType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter longitude';
                        }
                        return null;
                      },
                    ),
                    AppTextField(
                      controller: _phoneController,
                      hintText: 'Phone Number',
                      textInputType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppButton(
          onTap: () {
            if (_formKey.currentState!.validate()) {
              // Process registration
              // You can access the form data using the controllers
              // e.g., _emailController.text, _usernameController.text, etc.
              UserRegister userRegister = UserRegister(
                email: _emailController.text,
                username: _usernameController.text,
                password: _passwordController.text,
                phone: _phoneController.text,
                name: Name(
                  firstname: _firstNameController.text,
                  lastname: _lastNameController.text,
                ),
                address: Address(
                  number: int.parse(_numberController.text),
                  street: _streetController.text,
                  city: _cityController.text,
                  zipcode: _zipcodeController.text,
                  geolocation: Geolocation(
                    lat: _latController.text,
                    long: _longController.text,
                  ),
                ),
              );

              registerViewModel.registerUserApi(userRegister.toRawJson());
              log('Registration Successful');
            }
          },
          text: 'Register',
        ),
      ),
    );
  }
}
