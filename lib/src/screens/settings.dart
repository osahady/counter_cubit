import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_cubit/src/cubit/counter_cubit.dart';
import 'package:flutter_counter_cubit/src/cubit/settings_cubit/settings_cubit.dart';

class AppSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {
        final snackBar = SnackBar(
            content: Text(
                'app: ${state.appNotifications} email: ${state.emailNotifications}'));
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Column(
          children: [
            Builder(builder: (context) {
              final appNotificationState = context.select(
                (SettingsCubit settings) => settings.state.appNotifications,
              );

              return SwitchListTile(
                value: appNotificationState,
                title: Text('App Notifications'),
                onChanged: (value) {
                  context.read<SettingsCubit>().toggleAppNotifications(value);
                },
              );
            }),
            Builder(builder: (context) {
              final emailNotificationsState = context.select(
                (SettingsCubit settings) => settings.state.emailNotifications,
              );

              return SwitchListTile(
                value: emailNotificationsState,
                title: Text('Email Notifications'),
                onChanged: (value) {
                  context.read<SettingsCubit>().toggleEmailNotifications(value);
                },
              );
            }),
          ],
        ),
      ),
    );
    //   return Scaffold(
    //     appBar: AppBar(
    //       title: Text('settings'),
    //     ),
    //     body: BlocConsumer<SettingsCubit, SettingsState>(
    //       listener: (context, state) {
    //         final snackBar = SnackBar(
    //             content: Text(
    //                 'App: ${state.appNotifications}, Email: ${state.emailNotifications} '));
    //         ScaffoldMessenger.of(context)
    //           ..hideCurrentSnackBar()
    //           ..showSnackBar(snackBar);
    //       },
    //       builder: (context, state) => Column(
    //         children: [
    //           SwitchListTile(
    //             value: state.appNotifications,
    //             onChanged: (val) {
    //               context.read<SettingsCubit>().toggleAppNotifications(val);
    //             },
    //             title: Text('App Notifications '),
    //           ),
    //           SwitchListTile(
    //             value: state.emailNotifications,
    //             onChanged: (val) {
    //               context.read<SettingsCubit>().toggleEmailNotifications(val);
    //             },
    //             title: Text('Email Notifications '),
    //           ),
    //           ElevatedButton(
    //             child: Text('set state'),
    //             onPressed: () {
    //               context.read<SettingsCubit>().toggleAppNotifications(true);
    //             },
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
  }
}
