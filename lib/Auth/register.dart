import 'package:flutter/material.dart';
import 'package:graduation_project/Auth/login.dart';

import '../color/color.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool obscureText1 = true;
  bool obscureText2 = true;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  final emailController = TextEditingController();
  final passController = TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    phoneController.dispose();


    emailController.dispose();
    passController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRR305dpodzFBveKnuC7uKfRsi6tIxXHW0K4jKM8nY6peN2KKfYKp3tTqn94ktgaCi5JSo&usqp=CAU',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
    ),
              Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(top: 250),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                child: Column(
                  children: [
                    ui(),
                  ],
                ),
              ),
            ])]))
    );
  }
  Widget ui() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          const SizedBox(height: 20),
          TextFormField(
            controller: nameController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              label:Text('Name',style: TextStyle(color: Colors.grey)) ,
             // border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person, color: mainColor,),
            ),
          ),


          const SizedBox(height: 10),
          TextFormField(
            controller: emailController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              label:const Text('Email',style: TextStyle(color: Colors.grey)) ,
              //border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email, color:mainColor,),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: phoneController,
            textInputAction: TextInputAction.next,
            maxLength: 11,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              label:const Text('Phone',style: TextStyle(color: Colors.grey)) ,
              // border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.phone,color: mainColor,),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: passController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.visiblePassword,
            obscureText: obscureText1,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText1 = !obscureText1;
                    });
                  }
                  ,
                  icon: Icon(
                    obscureText1 ? Icons.visibility_off : Icons.visibility,
                    color:mainColor,)),

              label:const Text('Password',style: TextStyle(color: Colors.grey)) ,
              //border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.lock, color: mainColor),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.visiblePassword,
            obscureText: obscureText2,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText2 = !obscureText2;
                    });
                  }
                  ,
                  icon: Icon(
                    obscureText2 ? Icons.visibility_off : Icons.visibility,
                    color: mainColor,)),

              label:const Text('Re-Password',style: TextStyle(color: Colors.grey)) ,
              // border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.lock, color: mainColor),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: mainColor, ),
              child: const Text (
                'Register', style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
          ),
          const SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have account?',style: TextStyle(color: Colors.black),),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.pop(context, MaterialPageRoute(
                        builder: (context) => const Login()));
                  },
                  child: const Text('Login',
                    style: TextStyle(fontWeight: FontWeight.bold,color: mainColor),),
                )
              ]
          ),
        ],
      ),
    );
  }


}
