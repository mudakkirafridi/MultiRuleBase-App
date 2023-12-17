import 'package:flutter/material.dart';
import 'package:multirulebase_app/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String myName = '', myEmail = '', myPass = '', myType = '';
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    myName = sp.getString('email') ?? '';
    myEmail = sp.getString('email') ?? '';
    myPass = sp.getString('pass') ?? '';
    myType = sp.getString('userType') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        elevation: 9.9,
        backgroundColor: Colors.blue[100],
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text('Your Name'), Text(myName)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text('Your Email'), Text(myEmail)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text('Your Password'), Text(myPass)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text('UserType'), Text(myType)],
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.clear();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LogInScreen()));
              },
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 8,
                      )
                    ],
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(24)),
                height: 50,
                width: 200,
                child: const Center(child: Text('LogOut')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
