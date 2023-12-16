import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:multirulebase_app/pages/home_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _key = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _key,
            child: Column(
              children: [
                const Image(
                    width: 250, image: AssetImage('assets/images/login.png')),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Welcome $name',
                  style: const TextStyle(fontSize: 22),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: "Enter Name",
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(15))),
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Name";
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Enter Email",
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(15))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Email";
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: passController,
                  decoration: InputDecoration(
                      hintText: "Enter Password",
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(15))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Password";
                    }
                  },
                ),
                const SizedBox(
                  height: 70,
                ),
                InkWell(
                  onTap: () async {
                    if (_key.currentState!.validate()) {
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();
                      sp.setString("name", nameController.text.toString());
                      sp.setString("email", emailController.text.toString());
                      sp.setString("pass", passController.text.toString());
                      sp.setBool("islogin", true);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25)),
                    child: const Center(
                      child: Text(
                        'LogIn',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
