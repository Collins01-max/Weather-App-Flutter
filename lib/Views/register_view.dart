import 'package:flutter/material.dart';
import 'package:weather_app/Views/Widgets/custom_button.dart';
import 'package:weather_app/Views/Widgets/custom_field.dart';

class RegisterView extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomField(
                controller: nameController,
                hintText: "Kevin Jones",
                icon: Icon(Icons.person_outline),
                // ignore: missing_return
                onSaved: (String v) {
                  print(v.trim());
                },
                textInputType: TextInputType.multiline,

                validator: (String v) {
                  if (v.isEmpty) {
                    return "A username is required";
                  }
                },
              ),
              CustomField(
                controller: emailController,
                hintText: "KevinJones@gmail.com",
                icon: Icon(Icons.email),
                // ignore: missing_return
                onSaved: (String v) {
                  print(v.trim());
                },
                textInputType: TextInputType.emailAddress,

                validator: (String v) {
                  if (v.isEmpty) {
                    return "A valid email is required";
                  }
                },
              ),
              CustomField(
                controller: passwordController,
                hintText: "******",
                icon: Icon(Icons.vpn_key),
                // ignore: missing_return
                onSaved: (String v) {
                  print(v.trim());
                },
                textInputType: TextInputType.multiline,

                validator: (String v) {
                  if (v.isEmpty) {
                    return "A strong pin is required";
                  }
                },
              ),
              CustomButton(
                function: () {},
                title: "REGISTER",
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "loginView");
                    },
                    child: Text.rich(
                      TextSpan(
                        text: "Have an account already?",
                        children: <TextSpan>[
                          TextSpan(text: " Login"),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
