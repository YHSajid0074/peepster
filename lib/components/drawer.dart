import 'package:flutter/material.dart';
import 'package:peepster/components/drawer_tile.dart';
import 'package:peepster/Pages/setting_page.dart';
import 'package:peepster/services/auth/auth_service.dart';


class MyDrawer extends StatelessWidget {
   MyDrawer({super.key});
  final _auth =AuthService();
  void logout(){
    _auth.logout();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:Theme.of(context).colorScheme.secondary,
    child: SafeArea(
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Icon(Icons.person,
              size:72,
              color: Theme.of(context).colorScheme.primary,),
            ),
            SizedBox(height: 25,),
            Divider(
              indent: 25,
              endIndent: 25,
              color: Theme.of(context).colorScheme.primary,
            ),
           SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.fromLTRB(20, 20,0,0),
             child: DrawerTile(
               title: 'H O M E',
               icon: Icons.home,
               onTap: (){
                  Navigator.pop(context);
               },
             ),
           ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20,0,0),
              child: DrawerTile(
                title: 'P R O F I L E',
                icon: Icons.person,
                onTap: (){

                },

              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20,0,0),
              child: DrawerTile(
                title: 'S E T T I N G S',
                icon: Icons.settings,
                onTap: (){
                 Navigator.pop(context);
                 Navigator.push(context,
                   MaterialPageRoute(
                   builder: (context)=>SettingPage(),
                 ),
                 );
                },
              ),
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.fromLTRB(23, 20,0,0),
              child: DrawerTile(
                  title: 'L O G O U T',
                  icon:Icons.logout,
                  onTap: logout),
            )
          ],
        )
    ),

    );
  }
}
