import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class phoneNumber extends StatefulWidget {
  static String verify="";
  const phoneNumber({super.key});

  @override
  State<phoneNumber> createState() => _phoneNumberState();
}

class _phoneNumberState extends State<phoneNumber> {
  TextEditingController countryCode=TextEditingController();
  var phone="";
  @override
  void initState(){
    countryCode.text="+91";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "You'll receive a 4 digit code to verify next.",
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 20,),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(width: 2,color: Colors.grey.shade800),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 12,),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countryCode,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      "-",
                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),

                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: TextField(
                        onChanged: (value){
                          phone=value;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "Mobile Number",

                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 25,),
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0))
                  ),
                  onPressed: ()async{
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '${countryCode.text+phone}',
                      verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        phoneNumber.verify=verificationId;
                        Navigator.pushNamed(context, 'otp');
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                    //Navigator.pushNamed(context, 'otp');
                  },
                  child: Text("CONTINUE",style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
