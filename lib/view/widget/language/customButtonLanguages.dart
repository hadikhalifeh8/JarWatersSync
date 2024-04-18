import 'package:flutter/material.dart';



class CustomButtonLanguage extends StatelessWidget {
    final String textbuttonName ;
  final void Function()? onPressed;

  const CustomButtonLanguage({Key? key, required this.textbuttonName, this.onPressed}) 
       : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              width: double.infinity,
              child: MaterialButton(
                color: Colors.blue,
                textColor: Colors.white,
              
                 onPressed: onPressed,
                child:  Text(textbuttonName, style: const TextStyle(fontWeight:FontWeight.bold ),)
              ),
            );
  }
}