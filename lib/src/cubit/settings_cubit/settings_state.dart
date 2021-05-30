part of 'settings_cubit.dart';

@immutable
class SettingsState extends Equatable {
  final bool appNotifications;
  final bool emailNotifications;

  SettingsState({
    required this.appNotifications,
    required this.emailNotifications,
  });

  SettingsState copyWith({
    bool? appNotificationsNew,
    bool? emailNotificationsNew,
  }) {
    return SettingsState(
      appNotifications: appNotificationsNew ?? this.appNotifications,
      emailNotifications: emailNotificationsNew ?? this.emailNotifications,
    );
  }

  @override
  List<Object?> get props => [
        appNotifications,
        emailNotifications,
      ];

  @override
  String toString() =>
      'SettingsState(appNotifications: $appNotifications, emailNotifications: $emailNotifications)';
}
