
import 'package:flutter/material.dart';
import 'package:doctor_g/constant.dart';
import 'package:doctor_g/pages/auth/login.dart';
import 'package:doctor_g/pages/edit_profile_page.dart';

class Register extends StatefulWidget {

  Register({Key? key}) : super(key: key);
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child:CircleAvatar(
                radius:45,
                backgroundColor: Colors.blue[900],
                child: CircleAvatar(
                  backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/5128/5128547.png'),
                  radius:42,
                ),
              ), ),

            const SizedBox(
              height:10,
            ),
            Text('Doctor G',
              style: TextStyle(
                color: Colors.blue[900],
                fontSize: 32,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: 55,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  iconColor: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 55,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  iconColor: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 55,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.key),
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  iconColor: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: InkWell(
                onTap: (){
                  authController.registerUser(
                      _usernameController.text,
                      _emailController.text,
                      _passwordController.text
                  );
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditProfilePage()));
                },
                child: const Center(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account? ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.indigo,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login(),
                  ),
                  ),

                  child: Text(
                    'Login',
                    style: TextStyle(fontSize:18, color: Colors.blue[700],fontWeight: FontWeight.w500),
                  ),
                ),
              ],

            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: (){},
              child: Text(
                'Forgot password ?',
                style: TextStyle(fontSize:16, color: Colors.blue[700],fontWeight: FontWeight.w400),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
