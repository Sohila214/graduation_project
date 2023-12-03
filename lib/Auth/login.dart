import 'package:flutter/material.dart';
import 'package:graduation_project/Auth/forgetPass.dart';
import 'package:graduation_project/Auth/register.dart';

import '../color/color.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscureText = true;
  final emailController = TextEditingController();
  var passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey =GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Text('Login',style: TextStyle(color: mainColor,fontSize: 30,fontWeight: FontWeight.bold),),
                              loginPage(),
                            ],
                          ),
                        ),
                      ])]))
    );

  }
  Widget loginPage() {
    return Column(
        children: [
          Form(
            key: formKey,
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Login',style: TextStyle(color: mainColor,fontSize: 30,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 30,),
                  TextFormField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value){
                      if (value!.isEmpty){
                        return'please enter your email';
                      }
                      if(!value.contains('@')|| !value.contains('.')){
                        return 'Invalid email';
                      }
                      return null;
                    },

                    decoration: const InputDecoration(
                        label: Text('Email',style: TextStyle(color: Colors.grey),),
                       // border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email_outlined,color: mainColor,)
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    obscureText: obscureText,
                    controller: passwordController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value){
                      if (value!.isEmpty){
                        return'please enter your password';
                      }
                      if(value.length<6){
                        return 'Invalid password';
                      }
                      return null;
                    },
                    decoration:  InputDecoration(
                     // border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock_outline,color: mainColor,),
                      suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              obscureText=!obscureText;
                            });
                          }
                          , icon:Icon(obscureText? Icons.visibility_off:Icons.visibility,color: mainColor,)),

                      label:const Text('Password',style: TextStyle(color: Colors.grey)) ,
                    ),
                  ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const ForgetPass()));

                    },
                    child: const Text('Forget Password?',
                      style: TextStyle(fontWeight: FontWeight.bold,color: mainColor),),
                  ),
                ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: mainColor,
                      ),
                      child: const Text ('Log in',style: TextStyle(color: Colors.white,fontSize: 20)),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don`t have account?',style: TextStyle(color: Colors.black),),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 15),
                          ),
                          onPressed: () => register(),
                          child: const Text('Register',
                            style: TextStyle(fontWeight: FontWeight.bold,color: mainColor),),
                        )
                      ]
                  ),
                ],
              ),
            ),
          ),
        ]
    );

  }

  register() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const Register()));
  }





}
