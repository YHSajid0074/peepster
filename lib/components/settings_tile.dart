import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {

  final String title;
  final Widget action;



  const SettingsTile({
    super.key,
    required this.title,
    required this.action
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius:BorderRadius.circular(25)
      ),
      margin:const EdgeInsets.only(left: 25,right: 25,top: 10),
      padding: EdgeInsets.all(10),
      child:  ListTile(
            title: Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
            trailing:action
        )
    );

  }
}
