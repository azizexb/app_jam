import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/selection_page.dart';
import 'package:flutter_application_1/sign_up_page.dart';
import 'package:flutter_application_1/social_sign_in_button.dart';
import 'package:flutter_application_1/text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  late String email , password;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void _signInWithEmailAndPassword(BuildContext context, String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Kullanıcı giriş yaptığında yapılacak işlemler
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyWidget()), // Kullanıcı giriş yaptığında yönlendirilecek ekran
      );
    } catch (e) {
      // Hata durumunda kullanıcıya bilgilendirme veya hatayı gösterme
      print('Giriş yapılamadı: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                child: Column(
                  children: [
                    Text(
                      'Giriş Yap',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    MyTextField(
                      labelText: 'Email gir',
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen email girin';
                        }
                        return null; // Geçerli
                      },
                      onSaved: (value) {
                        email = value;  
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MyTextField(
                      labelText: 'Şifre gir',
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Lütfen şifre girin';
                        }
                        return null; // Geçerli
                      },
                      onSaved: (value) {
                        password = value;

                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      'Şifremi unuttum',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                     try {
                        var userResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
                        print(userResult.user!.uid);
                     } catch (e) {
                       print(e.toString());
                     }
                      // Form doğrulandıysa giriş yapma işlemi başlat
                      // Burada email ve şifre alınır
                      //final email = ""; // Emaili al
                     // final password = ""; // Şifreyi al
                      _signInWithEmailAndPassword(context, email, password);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amberAccent),
                  ),
                  child: const Text(
                    'Giriş Yap',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Veya',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpPage(key: UniqueKey()),
                    ),
                  );
                },
                child: const Text(
                  'Hesap Oluştur',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SocialSignInButton(),
            ],
          ),
        ),
      ),
    );
  }
}
