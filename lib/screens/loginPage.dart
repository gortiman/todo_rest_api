import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/maintenance2.png",width: 100,height:200),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Maintenance",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'RobotoSerif',
                        color: Colors.black,
                    ),
                  ),
                  Text(
                    "Box",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'RobotoVariable',
                      color: Colors.deepOrange,
                    ),
                  ),
                  
                  SizedBox(height: 20,),
                ],
              )
            ],
          ),
          
          Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. L",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
            textAlign: TextAlign.center,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Email",
                fillColor: Colors.grey.withOpacity(0.2),
                filled: true,
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.email,color: Colors.black,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black
                  )
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Colors.black
                    )
                )
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "password",
                  fillColor: Colors.grey.withOpacity(0.2),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.lock,color: Colors.black,),
                  suffixIcon: Icon(Icons.visibility_off, color: Colors.black,),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.black
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.black
                      )
                  )
              ),
            ),
          ),
          SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Forgot Password?",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),

          SizedBox(height: 20,),
          Container(
            height: 40,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text("Login",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have account | ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'RobotoSerif',
                  color: Colors.black,
                ),
              ),
              Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'RobotoVariable',
                  color: Colors.deepOrange,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
