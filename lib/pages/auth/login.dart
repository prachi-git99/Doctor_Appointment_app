import 'package:flutter/material.dart';
import 'package:doctor_g/pages/auth/register.dart';
import 'package:doctor_g/constant.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //login function then create a controller

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController =TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
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
              height:20,
            ),
            Text('Doctor G',
              style: TextStyle(
                color: Colors.blue[900],
                fontSize: 32,
                fontWeight: FontWeight.w300,
              ),

            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height:55,
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
              height: 55,
              width: MediaQuery.of(context).size.width,
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
                  Radius.circular(20),
                ),
              ),
              child: InkWell(
                onTap: () => authController.loginUser(
                  _emailController.text,
                  _passwordController.text,
                ),
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // const Text(
            //   '-----Or Continue With------',
            //   style: TextStyle(
            //     fontSize: 20,
            //     color: Colors.white,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // const SizedBox(
            //   height: 15,
            // ),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account? ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.indigo,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Register(),
                    ),
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 18, color: Colors.blue[700],fontWeight: FontWeight.w400),
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
                style: TextStyle(fontSize:18, color: Colors.blue[900],fontWeight: FontWeight.w400),
              ),
            ),

          ],
        ),
      ),
    );
  }
}