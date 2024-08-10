import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromRGBO(143, 148, 251, 1),
      	                  Color.fromRGBO(143, 148, 251, .6),
            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 45,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(duration: const Duration(milliseconds: 1000), child: const Text("Register here", style: TextStyle(color: Colors.white, fontSize: 40),)),
                  const SizedBox(height: 10,),
                  FadeInUp(duration: const Duration(milliseconds: 1300), child: const Text("Here to get welcomed", style: TextStyle(color: Colors.white, fontSize: 18),)),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                           const SizedBox(height: 40,),
                          FadeInUp(duration: const Duration(milliseconds: 1400), child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [BoxShadow(
                                color: Color.fromRGBO(139, 126, 118, 0.298),
                                blurRadius: 20,
                                offset: Offset(0, 10)
                              )]
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                  ),
                                  child:  const TextField(
                                    decoration: InputDecoration(
                                      labelText: "Name",
                                      // hintText: "Email or Phone number",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                               
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                  ),
                                  child:  const TextField(
                                    decoration: InputDecoration(
                                      labelText: "Email ",
                                      // hintText: "Email or Phone number",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                  ),
                                  child:  TextField(
                                    obscureText: _obscureText,
                                    decoration: InputDecoration(
                                      labelText: "Password",
                                      // hintText: "Password",
                                      hintStyle: const TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                      suffixIcon: IconButton(onPressed: (){
                                        setState(() {
                                          _obscureText =!_obscureText;
                                        });
                                      }, icon: Icon(_obscureText? Icons.visibility:Icons.visibility_off))
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                  ),
                                  child:  TextField(
                                    obscureText: _obscureText,
                                    decoration: InputDecoration(
                                      labelText: " Confirm Password",
                                      // hintText: "Password",
                                      hintStyle: const TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                      suffixIcon: IconButton(onPressed: (){
                                        setState(() {
                                          _obscureText =!_obscureText;
                                        });
                                      }, icon: Icon(_obscureText? Icons.visibility:Icons.visibility_off))
                                    ),
                                  ),
                                ),
                              ],
                              
                            ),
                          )),
                           const SizedBox(height: 40,),
                          // FadeInUp(duration: const Duration(milliseconds: 1500), child: const Text("Forgot Password?", style: TextStyle(color: Colors.grey),)),
                          // const SizedBox(height: 20,),
                          FadeInUp(duration: const Duration(milliseconds: 1600), child: MaterialButton(
                            onPressed: () {},
                            height: 50,
                            // margin: EdgeInsets.symmetric(horizontal: 50),
      	                                  color:const Color.fromRGBO(143, 148, 251, .6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                                    
                            ),
                            // decoration: BoxDecoration(
                            // ),
                            child: const Center(
                              child: Text("Create Account", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900,fontSize: 25),),
                            ),
                            
                          )
                          ),
                          const SizedBox(height: 10,),
                          // FadeInUp(duration: const Duration(milliseconds: 1700),child: const Text('New User? Register ',style: TextStyle(color: Colors.grey,fontSize: 15),)),
                             FadeInUp(duration: const Duration(milliseconds: 1700),child:  Text.rich(TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Have an account? ',
                                  style: TextStyle(color: Colors.grey,fontSize: 15) 
                                ),
                                
                                TextSpan(
                text: 'Login',
                style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
  recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, '/login');
                  },                
              ),
                              ]
                             ),)),

                          const SizedBox(height: 10,),
                          
                            Transform.scale(
      	                            scale: 0.3,
      	                            child: Image.asset('assets/images/HorizontalLogo.png',
      	                            ),
      	                          ),
                        ],
                      ),
                    ),
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}