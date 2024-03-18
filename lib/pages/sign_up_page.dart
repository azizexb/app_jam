// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email, _password;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        // ignore: unused_local_variable
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('Şifre zayıf. Daha güçlü bir şifre seçiniz.');
        } else if (e.code == 'email-already-in-use') {
          print('Bu e-posta adresi ile zaten bir hesap oluşturulmuş.');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "images/background_images.jpg", 
              fit: BoxFit.cover,
            ),
          ),
          ListView(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Kayıt Ol',
                        style: TextStyle(
                          color: Color.fromARGB(255, 6, 3, 96),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    MyTextField(
                      labelText: 'İsim',
                      obscureText: false,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Lütfen isim giriniz';
                        }
                        return null;
                      },
                      onSaved: (value) {
                      },
                    ),
                    const SizedBox(height: 15),
                    MyTextField(
                      labelText: 'Soyisim',
                      obscureText: false,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Lütfen soyisim giriniz';
                        }
                        return null;
                      },
                      onSaved: (value) {
                      },
                    ),
                    const SizedBox(height: 15),
                    MyTextField(
                      labelText: 'E-posta',
                      obscureText: false,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Lütfen e-posta adresinizi giriniz';
                        } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                          return 'Lütfen geçerli bir e-posta adresi giriniz';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _email = value!;
                      },
                    ),
                    const SizedBox(height: 15),
                    MyTextField(
                      labelText: 'Şifre',
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Lütfen şifrenizi giriniz';
                        } else if (value.length < 6) {
                          return 'Şifreniz en az 6 karakter uzunluğunda olmalıdır';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _password = value!;
                      },
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: _submitForm,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 1, 54, 61),),
                        ),
                        child: const Text(
                          'Kayıt Ol',
                          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Fotoğraf
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: SignUpPage(),
  ));
}
