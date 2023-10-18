import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:fitbro/tools/settings/localization_options.dart';
import 'package:flutter/material.dart';
import 'package:fitbro/tools/settings/settings_event.dart';

class SettingsMenu extends StatefulWidget {
  SettingsMenu({Key? key}) : super(key: key);

  @override
  State<SettingsMenu> createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  late final sections = [
    SettingsSection(
      title: context.loc.email_text_field_placeholder,
      settings: LocSettings(),
    ),
    SettingsSection(
      title: context.loc.password_reset,
      settings: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.settings),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          children: sections.map((e) => e.toPanel()).toList(),
          expansionCallback: (panelIndex, isExpanded) {
            setState(() {
              sections[panelIndex].isExpanded = !isExpanded;
            });
          },
        ),
      ),
    );
  }
}
