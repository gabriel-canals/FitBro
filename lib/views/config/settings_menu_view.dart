import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:fitbro/services/auth/bloc/auth_bloc.dart';
import 'package:fitbro/services/auth/bloc/auth_event.dart';
import 'package:fitbro/tools/settings/localization_options.dart';
import 'package:flutter/material.dart';
import 'package:fitbro/tools/settings/settings_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsMenu extends StatefulWidget {
  const SettingsMenu({Key? key}) : super(key: key);

  @override
  State<SettingsMenu> createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  late final sections = [
     SettingsSection(
      title: context.loc.profile_settings,
      settings: null,
    ),
    SettingsSection(
      title: context.loc.l10n_settings,
      settings: LocSettings(),
    ),
    SettingsSection(
      title: context.loc.password_reset,
      settings: null,
    ),
    SettingsSection(
      title: context.loc.password_reset,
      settings: null,
    ),
    SettingsSection(
      title: context.loc.contact_support,
      settings: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.loc.settings,
          style: const TextStyle(fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: ExpansionPanelList(
              children: sections.map((e) => e.toPanel()).toList(),
              expansionCallback: (panelIndex, isExpanded) {
                setState(() {
                  sections[panelIndex].isExpanded = !isExpanded;
                });
              },
            ),
          ),
          //! NO FUNCIONA
          TextButton(onPressed: () {
              context.read<AuthBloc>().add(
                    const LogOutAuthEvent(),
                  );
            }, child: Text(context.loc.logout))
        ],
      ),
    );
  }
}
