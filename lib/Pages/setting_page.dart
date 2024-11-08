import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import '../Themes/theme_provider.dart';
import 'package:peepster/components/settings_tile.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('S E T T I N G S'),
        centerTitle: true,
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
        SettingsTile(title: 'Dark Mode',
          action: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return CupertinoSwitch(
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              },
            );
          },
        ),)
        ],
      ),
    );
  }
}

