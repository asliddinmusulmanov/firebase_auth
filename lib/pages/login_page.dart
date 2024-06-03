import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_firebase_auth/pages/home_page.dart';
import 'package:learn_firebase_auth/services/auth_services.dart';
import 'package:learn_firebase_auth/services/util_service.dart';
import 'package:learn_firebase_auth/shared_preferens.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController loginEmailC = TextEditingController();
TextEditingController loginPasswordC = TextEditingController();

bool isnima = true;

bool errorText = true;

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff171A21),
      // body: Column(
      //   // mainAxisAlignment: MainAxisAlignment.center,
      //   // crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Image.asset("assets/images/img_3.png"),
      //   ],
      // ),
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://i.pinimg.com/474x/34/54/5e/34545e5c907e996fec0900139a9213fc.jpg",
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
                "Login",
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 50),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                controller: loginEmailC,
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
                  // if (value != null && value.contains("@gmail.com")) {
                  //   return null;
                  // } else {
                  //   return 'Please enter your email address\nExample => (example@gmail.com)';
                  // }
                  if (value != null && value.isNotEmpty) {
                    return null;
                  } else {
                    return "Pizdes foshfoa asogi haslgka sbgioasbg";
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
                controller: loginPasswordC,
                decoration: InputDecoration(
                  counterText: "Forgot Password?",
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
                  User? user1 = await AuthService.loginUser(context,
                      email: loginEmailC.text, password: loginPasswordC.text);
                  if (user1 != null) {
                    await setLoginState(true);
                    Utils.fireSnackBar("Successfully", context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  } else {
                    setState(() {});
                    errorText = false;
                  }
                },
                child: const Text(
                  "Login",
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
