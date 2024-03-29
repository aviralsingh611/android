import "package:flutter/material.dart";
class profileselect extends StatefulWidget {
  const profileselect({super.key});

  @override
  State<profileselect> createState() => _profileselectState();
}

class _profileselectState extends State<profileselect> {
  bool isPressed1 =false;
  bool isPressed2=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Please select your profile",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 55,
            ),
            Container(
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(width: 2,color: Colors.grey.shade800),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: isPressed1?Colors.black :Colors.white
                    ),
                    onPressed: (){
                      setState(() {
                        isPressed1=!isPressed1;
                      });
                    },
                    child: Text(""),
                  ),
                  SizedBox(width: 10,),
                  Image.asset(
                    'assets/image2.png',
                    width: 70,
                    height: 70,
                  ),
                  SizedBox(width: 40,),
                  Container(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15,),
                        Text(
                          "Shipper",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "asdlkjfk aksldfklj ad das flkjsadfewiaf ae kjwre",
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(width: 2,color: Colors.grey.shade800),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: isPressed2?Colors.black :Colors.white
                    ),
                    onPressed: (){
                      setState(() {
                        isPressed2=!isPressed2;
                      });
                    },
                    child: Text(""),
                  ),
                  SizedBox(width: 10,),
                  Image.asset(
                    'assets/image3.png',
                    width: 70,
                    height: 70,
                  ),
                  SizedBox(width: 40,),
                  Container(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15,),
                        Text(
                          "Transporter",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "asdlkjfk aksldfklj ad das flkjsadfewiaf ae kjwre",
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: 150,
              height: 30,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade900,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0))),
                  onPressed: (){},
                  child: Text("CONTINUE",style: TextStyle(color: Colors.white),)),
            )
          ],
        ),
      ),
    );
  }
}

