import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/Auth/login.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();


  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://i.pinimg.com/736x/0b/35/71/0b35711f903742a0623698cc9ce7ec65.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
            ),
            ui(),
          ],
        ),
      ),
    );
  }

  Widget ui() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formkey,
        child: Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Please enter your email address to recover your password.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold
                  ),),
                const SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Empty email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email, color: Colors.black54,),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},

                    child: const Text ('Reset Password',style: TextStyle(color: Colors.black),),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                   // width: 200,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
                      onPressed: () => back(),
                      child: const Text ('Go back',style: TextStyle(color: Colors.black),),
                    ),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }

  void displayToast(String message) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(

        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }


  back() {
    Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }
}
