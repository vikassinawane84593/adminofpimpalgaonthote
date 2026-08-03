import 'package:adminpanelofpimpalgaonthtevilage/Screens/mainnavigation.dart';
import 'package:adminpanelofpimpalgaonthtevilage/servise/FirebaseServise.dart';
import 'package:adminpanelofpimpalgaonthtevilage/servise/hive_servise.dart';
import 'package:adminpanelofpimpalgaonthtevilage/servise/timerservise.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;
  bool rememberMe = false;
  final _formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  InputDecoration _decoration({
    required String hint,
    required Icon prefixicons,
    IconButton? suffixicon}){
    return InputDecoration(
      hintText: hint,
      prefixIcon: prefixicons,


      suffixIcon: suffixicon,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),

      focusedBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),

    );
  }

  Future<void>login() async{

    try{
      UserCredential userCredential = await Authservise().login(
          emails: emailController.text,
          passwords: passwordController.text);

      Navigator.push(context, MaterialPageRoute(builder: (_)=>Mainnavigation()));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text( "Login Succseful"),
        ),
      );
      
      HiveService.savelogintime();
      
      TimerService().startLogoutTimer(context);
    }

    on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? "Login failed"),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Something went wrong"),
        ),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),
      body: Center(
        child: Container(
          width: 950,
          height: 550,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 15,
                offset: Offset(0, 5),
              )
            ],
          ),
          child: Row(
            children: [

              /// LEFT PANEL
              Container(
                width: 330,
                decoration: const BoxDecoration(
                  color: Color(0xff2E7D32),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.account_balance,
                        size: 55,
                        color: Color(0xff2E7D32),
                      ),
                    ),

                    SizedBox(height: 25),

                    Text(
                      "पिंपळगाव थोटे",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "ग्रामपंचायत",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white70,
                      ),
                    ),

                    SizedBox(height: 25),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "Village Administration System",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// RIGHT PANEL
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Form(
                    key:_formKey ,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        const Icon(
                          Icons.lock_outline,
                          size: 70,
                          color: Colors.orange,
                        ),

                        const SizedBox(height: 15),

                        const Text(
                          "Admin Login",
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "Welcome Back",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),

                        const SizedBox(height: 40),

                        TextFormField(
                          controller: emailController,

                          decoration: _decoration(
                            hint: "Email",
                            prefixicons: const Icon(Icons.email_outlined),

                          ),

                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please enter email";
                            }

                            if (!RegExp(r'^[\w.-]+@[\w.-]+\.\w+$')
                                .hasMatch(value.trim())) {
                              return "Please enter a valid email";
                            }

                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        TextFormField(
                          controller: passwordController,
                          obscureText: obscurePassword,
                          decoration:_decoration(
                              hint: 'Password',
                              prefixicons: Icon(Icons.lock),
                              suffixicon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      obscurePassword=!obscurePassword;
                                    });
                                  },
                                  icon: obscurePassword
                                      ?Icon(Icons.visibility)
                                      :Icon(Icons.visibility_off)
                              )

                          ),


                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter password";
                            }

                            if (value.length < 6) {
                              return "Password must be at least 6 characters";
                            }

                            return null;
                          },


                        ),

                        const SizedBox(height: 25),



                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {

                              login();

                            },
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}