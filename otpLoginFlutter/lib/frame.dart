import 'package:flutter/material.dart';

class frame extends StatefulWidget {
  const frame({super.key});

  @override
  State<frame> createState() => _frameState();
}

class _frameState extends State<frame> {
  String defaultLanguage="English";
  List<String> items=["English","Hindi","Telugu"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children:[
              Image.asset(
                'assets/image1.png',
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Please select your language",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "You can change the language at any time",
                style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w400,
                ),

              ),
              SizedBox(
                height: 10,
              ),
              DropdownButton(
                value: defaultLanguage,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String items){
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    defaultLanguage = newValue!;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 100,
                height: 30,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0))),
                  onPressed: (){
                    Navigator.pushNamed(context,'phone');
                  },
                  child: Text("Next",style: TextStyle(color: Colors.white),)),
              ),
              SizedBox(height: 100,),
              Image.asset(
                'assets/image4.png',
                width: 320,
                height: 70,
              ),

            ]
          )
        )
      )
    );
  }
}
