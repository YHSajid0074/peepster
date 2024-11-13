import 'package:flutter/material.dart';


class BioBox extends StatelessWidget {

  final String text;
  const BioBox({super.key,
  required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(25),
        
      ),
      
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.symmetric(horizontal: 25),

      child: Text(text.isNotEmpty?text:'Empty bio'
        ,style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
      ),

    );
  }
}
