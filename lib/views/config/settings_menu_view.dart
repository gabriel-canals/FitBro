import 'package:fitbro/constants/colors.dart';
import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:fitbro/services/auth/bloc/auth_bloc.dart';
import 'package:fitbro/services/auth/bloc/auth_event.dart';
import 'package:fitbro/tools/settings/account_settings.dart';
import 'package:fitbro/tools/settings/localization_options.dart';
import 'package:flutter/material.dart';
import 'package:fitbro/tools/settings/settings_event.dart';

class SettingsMenu extends StatefulWidget {
  const SettingsMenu({Key? key}) : super(key: key);

  @override
  State<SettingsMenu> createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  late final sections = [
    SettingsSection(
      title: context.loc.account_settings,
      settings: const AccountSettings(),
    ),
    SettingsSection(
      title: context.loc.l10n_settings,
      settings: const LocSettings(),
    ),
    SettingsSection(
      title: context.loc.contact_support,
      settings: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc =
        ModalRoute.of(context)!.settings.arguments as AuthBloc;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.loc.settings,
          style: const TextStyle(fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Theme(
                data: Theme.of(context).copyWith(cardColor: mainColor),
                child: ExpansionPanelList(
                  expandedHeaderPadding:
                      const EdgeInsets.symmetric(vertical: 0),
                  children: sections.map((e) => e.toPanel()).toList(),
                  expansionCallback: (panelIndex, isExpanded) {
                    setState(() {
                      sections[panelIndex].isExpanded = !isExpanded;
                    });
                  },
                ),
              ),
            ),

            //? Might lead to future problems
            TextButton(
                onPressed: () {
                  authBloc.add(const LogOutAuthEvent());
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(
                      Size(MediaQuery.of(context).size.width / 1.4, 1),
                    ),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.redAccent),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),
                        side: BorderSide.none))),
                child: Text(
                  context.loc.logout,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 16),
                ))
          ],
        ),
      ),
    );
  }
}
