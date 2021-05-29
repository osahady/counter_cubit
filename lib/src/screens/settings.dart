import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_cubit/src/cubit/settings_cubit/settings_cubit.dart';

class AppSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'),
      ),
      body: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          final snackBar = SnackBar(
              content: Text(
                  'App: ${state.appNotifications}, Email: ${state.emailNotifications} '));
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        },
        builder: (context, state) => Column(
          children: [
            SwitchListTile(
              value: state.appNotifications,
              onChanged: (val) {
                context.read<SettingsCubit>().toggleAppNotifications(val);
              },
              title: Text('App Notifications '),
            ),
            SwitchListTile(
              value: state.emailNotifications,
              onChanged: (val) {
                context.read<SettingsCubit>().toggleEmailNotifications(val);
              },
              title: Text('Email Notifications '),
            ),
            ElevatedButton(
              child: Text('set state'),
              onPressed: () {
                context.read<SettingsCubit>().toggleAppNotifications(true);
              },
            ),
          ],
        ),
      ),
    );
  }
}
