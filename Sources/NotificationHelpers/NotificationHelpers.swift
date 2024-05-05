import Combine
import ComposableArchitecture
import ComposableUserNotifications
import RemoteNotificationsClient

public func registerForRemoteNotificationsAsync(
  remoteNotifications: RemoteNotificationsClient,
  userNotifications: UserNotificationClient
) async {
  let settings = await userNotifications.getNotificationSettings()
  guard settings.authorizationStatus == .authorized || settings.authorizationStatus == .provisional
  else { return }
  // UIApplication.shared.registerForRemoteNotifications
  // Pushトークン取得
  await remoteNotifications.register()
}
