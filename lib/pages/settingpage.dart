import 'package:flutter/material.dart';
import 'package:meals/components/maindrawer.dart';
import 'package:meals/models/setting.dart';

class SettingPage extends StatefulWidget {
  final Setting setting;
  final Function(Setting) onSettingChanged;

  const SettingPage(this.setting, this.onSettingChanged);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late Setting setting;

  @override
  void initState() {
    super.initState();
    setting = widget.setting;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingChanged(setting);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuration'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configuration',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Gluten Free',
                  'Show gluten free meals.',
                  setting.isGlutenFree,
                  (value) => setState(() => setting.isGlutenFree = value),
                ),
                _createSwitch(
                  'Lactose Free',
                  'Show lactose free meals.',
                  setting.isLactoseFree,
                  (value) => setState(() => setting.isLactoseFree = value),
                ),
                _createSwitch(
                  'Vegan',
                  'Show vegan meals.',
                  setting.isVegan,
                  (value) => setState(() => setting.isVegan = value),
                ),
                _createSwitch(
                  'Vegetarian',
                  'Show vegetarian meals.',
                  setting.isVegetarian,
                  (value) => setState(() => setting.isVegetarian = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
