import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      	child: Column(
      	  children: <Widget>[
      	    Container(
      	      height: 400,
      	      decoration: const BoxDecoration(
      	        image: DecorationImage(
      	          image: AssetImage('assets/images/background.png'),
      	          fit: BoxFit.fill
      	        )
      	      ),
      	      child: Stack(
      	        children: <Widget>[
      	          Positioned(
      	            left: 30,
      	            width: 80,
      	            height: 200,
      	            child: FadeInUp(duration: const Duration(seconds: 1), child: Container(
      	              decoration: const BoxDecoration(
      	                image: DecorationImage(
      	                  image: AssetImage('assets/images/light-1.png')
      	                )
      	              ),
      	            )),
      	          ),
      	          Positioned(
      	            left: 140,
      	            width: 80,
      	            height: 150,
      	            child: FadeInUp(duration: const Duration(milliseconds: 1200), child: Container(
      	              decoration: const BoxDecoration(
      	                image: DecorationImage(
      	                  image: AssetImage('assets/images/light-2.png')
      	                )
      	              ),
      	            )),
      	          ),
      	          Positioned(
      	            right: 40,
      	            top: 40,
      	            width: 80,
      	            height: 150,
      	            child: FadeInUp(duration: const Duration(milliseconds: 1300), child: Container(
      	              decoration: const BoxDecoration(
      	                image: DecorationImage(
      	                  image: AssetImage('assets/images/clock.png')
      	                )
      	              ),
      	            )),
      	          ),
      	          Positioned(
      	            child: FadeInUp(duration: const Duration(milliseconds: 1600), child: Container(
      	              margin: const EdgeInsets.only(top: 80),
      	              child: Center(
      	                child: Transform.scale(
      	                            scale: 0.8,
      	                            child: Image.asset('assets/images/HorizontalLogo-light.png',
      	                            ),
      	                          ),
      	              ),
      	            )),
      	          )
      	        ],
      	      ),
      	    ),
      	              // Transform.scale(
      	              //               scale: 0.6,
      	              //               child: Image.asset('assets/images/HorizontalLogo.png',
      	              //               ),
      	              //             ),
      	    Padding(
      	padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
      	      child: Column(
      	        children: <Widget>[
      	          FadeInUp(duration: const Duration(milliseconds: 1800), child: Container(
      	            padding: const EdgeInsets.all(5),
      	            decoration: BoxDecoration(
      	              color: Colors.white,
      	              borderRadius: BorderRadius.circular(10),
      	                        border: Border.all(color: const Color.fromRGBO(143, 148, 251, 1)),
      	              boxShadow: const [
      	                BoxShadow(
      	                  color: Color.fromRGBO(143, 148, 251, .2),
      	                  blurRadius: 20.0,
      	                  offset: Offset(0, 10)
      	                )
      	              ]
      	            ),
      	            child: Column(
      	              children: <Widget>[
      	                Container(
      	                  padding: const EdgeInsets.all(8.0),
      	                  decoration: const BoxDecoration(
      	                    border: Border(bottom: BorderSide(color:  Color.fromRGBO(143, 148, 251, 1)))
      	                  ),
      	                  child: TextField(
      	                    decoration: InputDecoration(
      	                      border: InputBorder.none,
      	                      hintText: "Email or Phone number",
      	                      hintStyle: TextStyle(color: Colors.grey[700])
      	                    ),
      	                  ),
      	                ),
      	                Container(
      	                  padding: const EdgeInsets.all(8.0),
      	                  child: TextField(
                              obscureText: _obscureText,      	                   
                              decoration: InputDecoration(
      	                      border: InputBorder.none,
      	                      hintText: "Password",
      	                      hintStyle: TextStyle(color: Colors.grey[700]),
                              suffixIcon: IconButton(
                                        onPressed: (){
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                        icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off)
                                      )
      	                    ),
      	                  ),
      	                )
      	              ],
      	            ),
      	          )),
      	          const SizedBox(height: 10,),
      	                    FadeInUp(duration: const Duration(milliseconds: 2000), child: const Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),
      	          const SizedBox(height: 20,),
      	                    FadeInUp(duration: const Duration(milliseconds: 1900), child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/home');
                              },
                                                          child: Container(
                                                                              height: 50,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(10),
                                                                                gradient: const LinearGradient(
                                                                                  colors: [
                                                                                    Color.fromRGBO(143, 148, 251, 1),
                                                                                    Color.fromRGBO(143, 148, 251, .6),
                                                                                  ]
                                                                                )
                                                                              ),
                                                                              child:  Center(
                                                                                child: const Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                                                              ),
                                                                            ),
                                                        )),
      	                    const SizedBox(height: 10,),
      	                        FadeInUp(
      	                          duration: const Duration(milliseconds: 1700),
      	                          child: Text.rich(
      	                            TextSpan(
      	                              children: [
      	                                const TextSpan(
      	                                  text: 'New User? ',
      	                                  style: TextStyle(color: Colors.grey, fontSize: 15)
      	                                ),
      	                                TextSpan(
      	                                  text: 'Register',
      	                                  style: const TextStyle(
      	                                    color: Colors.black,
      	                                    fontSize: 15,
      	                                    fontWeight: FontWeight.bold
      	                                  ),
      	                                  recognizer: TapGestureRecognizer()
      	                                    ..onTap = () {
      	                                      Navigator.pushNamed(context, '/signup');
      	                                    },
      	                                ),
      	                              ]
      	                            )
      	                          )
      	                        ),
      	                        const SizedBox(height: 10,),
      	                        FadeInUp(
      	                          duration: const Duration(milliseconds: 1800),
      	                          child: const Text(
      	                            "Continue with social media",
      	                            style: TextStyle(color: Colors.grey)
      	                          )
      	                        ),
      	                        const SizedBox(height: 20,),
      	                        Row(
      	                          children: <Widget>[
      	                            Expanded(
      	                              child: FadeInUp(
      	                                duration: const Duration(milliseconds: 1900),
      	                                child: MaterialButton(
      	                                  onPressed: (){},
      	                                  height: 40,
      	                                  color:const Color.fromRGBO(143, 148, 251, .6),
      	
      	                                  shape: RoundedRectangleBorder(
      	                                    borderRadius: BorderRadius.circular(50),
      	                                  ),
      	                                  child: const Center(
      	                                    child: Text(
      	                                      "Facebook",
      	                                      style: TextStyle(
      	                                        color: Colors.white,
      	                                        fontWeight: FontWeight.bold
      	                                      )
      	                                    ),
      	                                  )
      	                                )
      	                              )
      	                            ),
      	                            const SizedBox(width: 30,),
      	                            Expanded(
      	                              child: FadeInUp(
      	                                duration: const Duration(milliseconds: 2000),
      	                                child: MaterialButton(
      	                                  onPressed: () {},
      	                                  height: 40,
      	                                  shape: RoundedRectangleBorder(
      	                                    borderRadius: BorderRadius.circular(50),
      	                                  ),
      	                                  color: Colors.black,
      	                                  child: const Center(
      	                                    child: Text(
      	                                      "Gmail",
      	                                      style: TextStyle(
      	                                        color: Colors.white,
      	                                        fontWeight: FontWeight.bold
      	                                      )
      	                                    ),
      	                                  )
      	                                )
      	                              )
      	                            )
      	                          ],
      	                        )
      	        ],
      	      ),
      	    )
      	  ],
      	),
      )
    );
  }
}
