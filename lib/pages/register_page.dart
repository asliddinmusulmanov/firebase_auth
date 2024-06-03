import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_firebase_auth/models/auth_model.dart';
import 'package:learn_firebase_auth/pages/home_page.dart';
import 'package:learn_firebase_auth/pages/otp_page.dart';
import 'package:learn_firebase_auth/services/auth_services.dart';

import '../services/util_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

TextEditingController regNameC = TextEditingController();
TextEditingController regEmailC = TextEditingController();
TextEditingController regPasswordC = TextEditingController();
TextEditingController regConfirmPasswordC = TextEditingController();
EmailOTP myauth = EmailOTP();

bool isnima = true;

bool errorText = true;

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  Future<void> register(AuthModel authModel) async {
    String name = regNameC.text;
    String email = regEmailC.text;
    String pass = regPasswordC.text;
    if (name.isEmpty || name.length < 2) {
      Utils.fireSnackBar("Name is not filled", context);
    } else if (email.isEmpty || email.length < 2 || !email.contains("@")) {
      Utils.fireSnackBar("Email is badly formatted", context);
    } else if (pass.isEmpty || pass.length < 5) {
      Utils.fireSnackBar("Password should be more than 6 char", context);
    } else {
      User? user = await AuthService.registerUser(context, authModel);
      if (user != null) {
        if (mounted) {
          Utils.fireSnackBar("Successfully registered", context);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://i.pinimg.com/564x/7c/80/f8/7c80f80af059b2ab54ababcc0d971492.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 50),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                controller: regNameC,
                decoration: const InputDecoration(
                  counterStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    // color: Color(0xff454B60),
                    color: Colors.white,
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Name",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  hintStyle: TextStyle(
                    color: Color(0xff454B60),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                ),
                validator: (value) {
                  if (regNameC.text.isNotEmpty) {
                    return null;
                  } else {
                    return 'Please enter your name';
                  }
                },
                onChanged: (value) {
                  if (globalKey.currentState!.validate()) {
                    setState(() {});
                  }
                },
              ),
              const SizedBox(height: 40),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                controller: regEmailC,
                decoration: const InputDecoration(
                  counterStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    // color: Color(0xff454B60),
                    color: Colors.white,
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Email",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  hintStyle: TextStyle(
                    color: Color(0xff454B60),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value != null && value.contains("@gmail.com")) {
                    return null;
                  } else {
                    return 'Please enter your email address\nExample => (example@gmail.com)';
                  }
                },
                onChanged: (value) {
                  if (globalKey.currentState!.validate()) {
                    setState(() {});
                  }
                },
              ),
              const SizedBox(height: 40),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                controller: regPasswordC,
                decoration: InputDecoration(
                  counterStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      isnima = !isnima;
                      setState(() {});
                    },
                    icon: isnima
                        ? const Icon(
                            Icons.visibility_off,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: Colors.white,
                          ),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Password",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  hintStyle: const TextStyle(
                    color: Color(0xff454B60),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                ),
                validator: (value) {
                  RegExp regex = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
                  if (value != null && value.contains(regex)) {
                    return null;
                  } else {
                    return 'Must be 8 or more characters  and contain at least 1\nnumber or special character';
                  }
                },
                onChanged: (value) {
                  if (globalKey.currentState!.validate()) {
                    setState(() {});
                  }
                },
              ),
              const SizedBox(height: 40),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                controller: regConfirmPasswordC,
                decoration: InputDecoration(
                  counterStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      isnima = !isnima;
                      setState(() {});
                    },
                    icon: isnima
                        ? const Icon(
                            Icons.visibility_off,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: Colors.white,
                          ),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Confirm Password",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  hintStyle: const TextStyle(
                    color: Color(0xff454B60),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == regConfirmPasswordC.text) {
                    return null;
                  } else {
                    return "The verification password is incorrect";
                  }
                },
                onChanged: (value) {
                  if (globalKey.currentState!.validate()) {
                    setState(() {});
                  }
                },
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  fixedSize: const Size(double.maxFinite, 55),
                ),
                onPressed: () async {
                  AuthModel authModel = AuthModel(
                      name: regNameC.text,
                      phoneNumber: "phoneNumber",
                      email: regEmailC.text,
                      password: regPasswordC.text,
                      id: "id");
                  myauth.setConfig(
                    appEmail: authModel.email,
                    userEmail: authModel.email,
                    otpLength: 6,
                    otpType: OTPType.digitsOnly,
                    appName: "Email OTP",
                  );
                  if (await myauth.sendOTP() == true) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("OTP has been sent"),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Oops, OTP send failed"),
                    ));
                  }
                  await register(authModel);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerifyAccount(
                        authModel: authModel,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
