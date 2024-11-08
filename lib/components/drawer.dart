import 'package:flutter/material.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
    child: SafeArea(
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Icon(Icons.person,
              size:72,
              color: Theme.of(context).colorScheme.primary,),
            ),

            Divider(
              indent: 25,
              endIndent: 25,
              color: Theme.of(context).colorScheme.primary,
            )
          ],
        )
    ),

    );
  }
}
