import 'package:flutter/material.dart';
import 'package:weather_app/Views/Widgets/custom_button.dart';
import 'package:weather_app/Views/Widgets/custom_field.dart';

class LoginView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/sunny image.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(.5),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomField(
                textInputType: TextInputType.emailAddress,
                validator: (String v) {
                  if (v.isEmpty) {
                    return "A valid email is required";
                  }
                },
                controller: emailController,
                hintText: "weathernigga@gmail.com",
                icon: Icon(Icons.email),
                // ignore: missing_return
                onSaved: (String value) {
                  print(value.trim());
                },
              ),
              CustomField(
                validator: (value) {
                  if (value.isEmpty || value.length < 6) {
                    return "Pin must be 6 digitd plus";
                  }
                  return null;
                },
                textInputType: TextInputType.multiline,
                hintText: "******",
                icon: Icon(Icons.vpn_key),
                // ignore: missing_return
                onSaved: (String value) {
                  print(value.trim());
                },
                controller: passwordController,
              ),
              CustomButton(
                function: () {},
                title: "LOGIN",
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "registerView");
                    },
                    child: Text.rich(
                      TextSpan(
                        text: "Don't have an account yet?",
                        children: <TextSpan>[
                          TextSpan(text: " Register"),
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
