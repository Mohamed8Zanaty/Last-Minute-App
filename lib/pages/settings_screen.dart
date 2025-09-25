import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsIsOn=true;
  bool darkModeIsOn=false;
  bool privacyModeIsOn=true;
  String appVersion = '';
  void initState() {
    super.initState();
    _getVersion();
  }

  Future<void> _getVersion() async {
    final info = await PackageInfo.fromPlatform();
    print("VERSION IS: ${info.version}");
    setState(() {
      appVersion = info.version;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFf8f7fc),
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsetsDirectional.only(start: 22),
          child:  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,size: 20,color: Color(0xFF3730a2),)),

        ),
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Settings",style: TextStyle(color: Color(0xFF3730a2),fontWeight: FontWeight.bold,fontSize: 25),),
                Text("Customize your app experience",style: TextStyle(color: Color(0xFF3730a2),fontSize: 15),)
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.035,
            vertical: MediaQuery.sizeOf(context).height * 0.016,
          ),
          child: Column(
            children:[
              SizedBox(height: 20,),
              Container(
                width: double.infinity,

                decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width*0.0564),
                    boxShadow: [BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(-4, 4),
                      spreadRadius: 2,
                    )]
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.035,
                    vertical: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Preferences",style: TextStyle(color: Color(0xFF3730a2),fontWeight: FontWeight.bold,fontSize: 22),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width *0.11,
                          height: MediaQuery.sizeOf(context).width *0.11,
                          decoration: BoxDecoration(
                            color:Color(0xFFc7d2ff),
                            borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width*0.04),
                          ),
                          child: Icon(
                            Icons.notifications_none,
                            size:MediaQuery.sizeOf(context).width*0.06,
                            color: Color(0xFF7e22cd),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text("Push Notifications",style: TextStyle(color: Color(0xFF3730a2),fontWeight: FontWeight.bold,fontSize: 20)),
                            Text("Receive alerts For appointments and health updates",style: TextStyle(color: Color(0xFF3730a2),fontSize: 16))

                          ],),
                        ),
                        Transform.scale(
                          scale: 0.9,
                          child: Switch(
                            value: notificationsIsOn,
                            onChanged: (bool newValue) {
                              setState(() {
                                notificationsIsOn = newValue;
                              });
                            },
                            activeColor: Color(0xFFa78bfa),
                          ),
                        ),
                      ],),
                      SizedBox(height: 20,),
                      Row(children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width *0.11,
                          height: MediaQuery.sizeOf(context).width *0.11,
                          decoration: BoxDecoration(
                            color:Color(0xFFc7d2ff),
                            borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width*0.04),
                          ),
                          child: Icon(
                            Icons.dark_mode_outlined,
                            size:MediaQuery.sizeOf(context).width*0.06,
                            color: Color(0xFF7e22cd),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Dark Mode",style: TextStyle(color: Color(0xFF3730a2),fontWeight: FontWeight.bold,fontSize: 20)),
                              Text("Switch to dark theme",style: TextStyle(color: Color(0xFF3730a2),fontSize: 16))

                            ],),
                        ),
                        Transform.scale(
                          scale: 0.9,
                          child: Switch(
                            value: darkModeIsOn,
                            onChanged: (bool newValue) {
                              setState(() {
                                darkModeIsOn = newValue;
                              });
                            },
                            activeColor: Color(0xFFa78bfa),
                          ),
                        ),
                      ],),
                      SizedBox(height: 20,),
                      Row(children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width *0.11,
                          height: MediaQuery.sizeOf(context).width *0.11,
                          decoration: BoxDecoration(
                            color:Color(0xFFc7d2ff),
                            borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width*0.04),
                          ),
                          child: Icon(
                            Icons.shield_outlined,
                            size:MediaQuery.sizeOf(context).width*0.06,
                            color: Color(0xFF7e22cd),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Privacy Mode",style: TextStyle(color: Color(0xFF3730a2),fontWeight: FontWeight.bold,fontSize: 20)),
                              Text("Enhanced security for sensitive data",style: TextStyle(color: Color(0xFF3730a2),fontSize: 16))

                            ],),
                        ),
                        Transform.scale(
                          scale: 0.9,
                          child: Switch(
                            value: privacyModeIsOn,
                            onChanged: (bool newValue) {
                              setState(() {
                                privacyModeIsOn = newValue;
                              });
                            },
                            activeColor: Color(0xFFa78bfa),
                          ),
                        ),
                      ],),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,

                decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width*0.0564),
                    boxShadow: [BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(-4, 4),
                      spreadRadius: 2,
                    )]
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.035,
                    vertical: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Support",style: TextStyle(color: Color(0xFF3730a2),fontWeight: FontWeight.bold,fontSize: 22),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width *0.11,
                          height: MediaQuery.sizeOf(context).width *0.11,
                          decoration: BoxDecoration(
                            color:Color(0xFFc7d2ff),
                            borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width*0.04),
                          ),
                          child: Icon(
                            Icons.description_outlined,
                            size:MediaQuery.sizeOf(context).width*0.06,
                            color: Color(0xFF7e22cd),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Terms of Service",style: TextStyle(color: Color(0xFF3730a2),fontWeight: FontWeight.bold,fontSize: 20)),
                              Text("Read our terms and conditions",style: TextStyle(color: Color(0xFF3730a2),fontSize: 16))

                            ],),
                        ),
                        Icon(Icons.chevron_right,color: Color(0xFF3730a2),size: 25,)
                      ],),
                      SizedBox(height: 20,),
                      Row(children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width *0.11,
                          height: MediaQuery.sizeOf(context).width *0.11,
                          decoration: BoxDecoration(
                            color:Color(0xFFc7d2ff),
                            borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width*0.04),
                          ),
                          child: Icon(
                            Icons.help_outline,
                            size:MediaQuery.sizeOf(context).width*0.06,
                            color: Color(0xFF7e22cd),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Help & Support",style: TextStyle(color: Color(0xFF3730a2),fontWeight: FontWeight.bold,fontSize: 20)),
                              Text("Get help with using SoCare",style: TextStyle(color: Color(0xFF3730a2),fontSize: 16))

                            ],),
                        ),
                        Icon(Icons.chevron_right,color: Color(0xFF3730a2),size: 25,)
                      ],),
                      SizedBox(height: 20,),
                      Row(children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width *0.11,
                          height: MediaQuery.sizeOf(context).width *0.11,
                          decoration: BoxDecoration(
                            color:Color(0xFFc7d2ff),
                            borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width*0.04),
                          ),
                          child: Icon(
                            Icons.local_phone_outlined,
                            size:MediaQuery.sizeOf(context).width*0.06,
                            color: Color(0xFF7e22cd),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Contact Support",style: TextStyle(color: Color(0xFF3730a2),fontWeight: FontWeight.bold,fontSize: 20)),
                              Text("Reach out to our support team",style: TextStyle(color: Color(0xFF3730a2),fontSize: 16))

                            ],),
                        ),
                        Icon(Icons.chevron_right,color: Color(0xFF3730a2),size: 25,)
                      ],),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,

                decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width*0.0564),
                    boxShadow: [BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(-4, 4),
                      spreadRadius: 2,
                    )]
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.035,
                    vertical: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  child: Column(
                    children:[
                      Text("SoCare Version ${appVersion.isEmpty ? "Loading..." : appVersion}",style: TextStyle(color: Color(0xFF3730a2),fontSize: 15),),
                      SizedBox(height: 5,),
                      Text("© 2025 SoCare, All rights reserved.",style: TextStyle(color: Color(0xFF3730a2),fontSize: 12),),

                    ],
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