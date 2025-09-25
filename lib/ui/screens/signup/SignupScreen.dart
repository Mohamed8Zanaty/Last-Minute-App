import 'package:flutter/material.dart';

class SignupScreen  extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool HiddenPassword = true;
  bool HiddenConfirmPassword = true;

  var EmailController = TextEditingController();
  var PasswordController = TextEditingController();
  var NameController = TextEditingController();
  var ConfirmPasswordController = TextEditingController();

  var Formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/heart.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Sign up",
                style: TextStyle(
                    color: Color(0xFF673AB7),
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "Your AI-powered healthcare Compination",
                style: TextStyle(
                    color: Color(0xFF673AB7),
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Form(
                key: Formkey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF673AB7),
                          ),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: NameController,
                          decoration: InputDecoration(
                            hintText: "Enter your Name",
                            hintStyle:
                            TextStyle(fontSize: 15, color: Colors.black45),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your name";
                            }
                            if (value.length < 3) {
                              return "Name must be at least 3 characters long";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF673AB7),
                          ),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                            controller: EmailController,
                            decoration: InputDecoration(
                              hintText: "Enter your Email",
                              hintStyle: TextStyle(
                                  fontSize: 15, color: Colors.black45),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color(0xFF673AB7),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            validator: (String? myemail) {
                              if (myemail == null || myemail.isEmpty) {
                                return "Enter an Email";
                              } else if (!(myemail.contains(".com") &&
                                  myemail.contains('@'))) {
                                return "Enter a Valid Email";
                              }
                            }),
                        SizedBox(height: 10),
                        Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF673AB7),
                          ),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: PasswordController,
                          obscureText: HiddenPassword,
                          decoration: InputDecoration(
                            hintText: "Enter your Password",
                            hintStyle:
                            TextStyle(fontSize: 15, color: Colors.black45),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color(0xFF673AB7),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  HiddenPassword = !HiddenPassword;
                                });
                              },
                              icon: Icon(
                                HiddenPassword ? Icons.visibility_off : Icons.visibility,
                                color: Color(0xFF673AB7),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: (String? mypass) {
                            if (mypass == null || mypass.isEmpty) {
                              return "Enter a Password";
                            } else if (mypass.length < 6) {
                              return "Enter a Valid Password";
                            }
                          },
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Confirm Password",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF673AB7),
                          ),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: ConfirmPasswordController,
                          obscureText: HiddenConfirmPassword,
                          decoration: InputDecoration(
                            hintText: "Enter your Confirm Password",
                            hintStyle:
                            TextStyle(fontSize: 15, color: Colors.black45),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  HiddenConfirmPassword = !HiddenConfirmPassword;
                                });
                              },
                              icon: Icon(
                                HiddenConfirmPassword ? Icons.visibility_off : Icons.visibility,
                                color: Color(0xFF673AB7),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please confirm your password";
                            }
                            if (value != PasswordController.text) {
                              return "Passwords do not match";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (Formkey.currentState?.validate() == true) {
                                Navigator.pushReplacementNamed(context, '/home');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF673AB7),
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
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