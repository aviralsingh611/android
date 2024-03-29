import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_flutter/phoneNumber.dart';
import 'package:pinput/pinput.dart';

class myotp extends StatefulWidget {
  const myotp({super.key});

  @override
  State<myotp> createState() => _myotpState();
}

class _myotpState extends State<myotp> {
  final FirebaseAuth auth=FirebaseAuth.instance;
  TextEditingController otpControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    var code="";
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
                "Verify Phone",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Code is sent to",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 20,
              ),
              Pinput(
                length: 6,
                showCursor: true,
                onChanged: (value){
                  code=value;
                },
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0))
                  ),
                  onPressed: () async{
                    try{
                      PhoneAuthCredential credential=PhoneAuthProvider.credential(verificationId: phoneNumber.verify, smsCode: code);
                      await auth.signInWithCredential(credential);
                      Navigator.pushNamedAndRemoveUntil(context, 'profile', (route) => false);
                    }
                    catch(e){
                      print("Wrong OTP");
                    }
                  },
                  child: Text("VERIFY AND CONTINUE",style: TextStyle(color: Colors.white,fontSize: 15),),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Didn't receive the code?",style: TextStyle(color: Colors.grey),),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, 'phone', (route) => false);
                    },
                    child: Text(
                      "Request again",
                      style: TextStyle(color: Colors.black87),
                    )),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
