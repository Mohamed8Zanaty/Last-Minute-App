import 'package:flutter/material.dart';
import 'Logo.dart';

class LoginScreen extends StatelessWidget {
  var userNameController=TextEditingController();
  var userPasswordController=TextEditingController();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFf8f7fc) ,
      //extendBodyBehindAppBar: true,
      extendBody: true,
      body:SingleChildScrollView(child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height*0.08,),
            Logo(LogoSize: 120,),
            Text("Welcome to SoCare",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color(0xFF3730a2)),),
            Text("Your AI-powered healthcare Companion" ,style: TextStyle(fontSize: 20,color: Color(0xFFa78bfa),),),
            SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),
            Form(
              key: formKey,
              child: Container(
                width:MediaQuery.sizeOf(context).width*0.9 ,
                height: MediaQuery.sizeOf(context).height*0.45,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.circular(20.0),
                    boxShadow: [BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(-4, 4),
                      spreadRadius: 2,
                    )]
                ),

                child: Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.sizeOf(context).width * 0.08,
                    right: MediaQuery.sizeOf(context).width * 0.08,
                    top: MediaQuery.sizeOf(context).width * 0.05,
                    bottom: 0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email",style: TextStyle(color: Color(0xFF3730a2),fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.01,
                      ),
                      TextFormField(
                        controller: userNameController,
                        decoration: InputDecoration(
                          hintText: "Enter your email",
                          hintStyle: TextStyle(color: Colors.black45,fontSize: 15),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          isDense: true,
                        ),
                        //onChanged: (userEmail){},
                        validator: (userEmail){
                          if(userEmail?.isEmpty==true || userEmail == null)
                            return'Please enter an email';
                          else if(!(userEmail.contains("@")&& userEmail.contains(".com")))
                            return 'It is not an email form';
                        },

                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.01,
                      ),
                      Text("Password",style: TextStyle(color: Color(0xFF3730a2),fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.01,
                      ),
                      TextFormField(
                        controller: userPasswordController,
                        decoration: InputDecoration(
                          hintText: "Enter Your Password",
                          hintStyle: TextStyle(color: Colors.black45,fontSize: 15),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          isDense: true,
                        ),
                        validator: (userPassword){
                          if(userPassword?.isEmpty==true || userPassword == null)
                            return'Please enter a password';
                          else if(userPassword.length<6)
                            return 'Your password is less thsn 6 letters';
                        },
                        obscureText: true,
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.005,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(onPressed: (){}, child: Text("Forgot your password?",style: TextStyle(color: Color(0xFF7e22cd)),)),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.005,
                      ),
                      Container(
                        width: double.infinity,
                        height: 48,
                        child:
                        ElevatedButton(
                          onPressed: () {
                            if(formKey.currentState?.validate()==true){
                              /* showDialog(context: context, builder: (context)=>AlertDialog(title: Text(data),
                                     content: Text(data),));*/
                              //true validation

                            }

                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: Color(0xFF7e22cd),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )


                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Login",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              Icon(Icons.login,size: 18,),
                            ],
                          ),

                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Don't have an account?",style: TextStyle(fontSize: 16,color: Color(0xFF3730a2),),),
                          TextButton(onPressed: (){}, child: Text("Create one",style: TextStyle(fontSize: 16,color: Color(0xFF7e22cd),),)),
                        ],
                      ),
                    ],
                  ),
                ),

              ),
            ),
          ],
        ),
      ),),

    );
  }

}
