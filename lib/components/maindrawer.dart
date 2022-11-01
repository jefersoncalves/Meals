import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  Widget _createItem(IconData icon, String label, Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.brown,
            alignment: Alignment.bottomLeft,
            child: Text(
              'Let\'s Cook?',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          _createItem(
            Icons.restaurant,
            'Meals',
            () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.homePage),
          ),
          _createItem(
            Icons.settings,
            'Config',
            () => Navigator.of(context)
                .pushReplacementNamed(AppRoutes.settingPage),
          ),
        ],
      ),
    );
  }
}
