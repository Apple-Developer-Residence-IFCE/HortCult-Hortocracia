import SwiftUI
import UserNotifications

class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
    private var notificationIdentifier = "dailyNotification"
    private var notificationRequest: UNNotificationRequest?
    static var shared: NotificationManager = NotificationManager()
    
    func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Permissão concedida")
            } else {
                print("Permissão negada")
            }
        }
    }
    
    func scheduleNotificationConverter(timeString: String) {
        let timeComponents = timeString.split(separator: ":")
        guard timeComponents.count == 2,
              let hourString = timeComponents.first,
              let minuteString = timeComponents.last,
              let hour = Int(hourString),
              let minute = Int(minuteString) else {
            print("Formato de horário inválido. Use o formato HH:mm.")
            return
        }
        
        scheduleNotificationAtTime(hour: hour, minute: minute)
    }
    
    private func scheduleNotificationAtTime(hour: Int, minute: Int) {
        let content = UNMutableNotificationContent()
        content.title = "Título da Notificação"
        content.body = "Corpo da Notificação"
        content.sound = UNNotificationSound.default
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: notificationIdentifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().delegate = self
        
        // Cancelar notificação anterior antes de agendar a nova
        cancelScheduledNotification()
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Erro ao agendar a notificação: \(error.localizedDescription)")
            } else {
                print("Notificação agendada para todos os dias às \(hour):\(minute)")
                self.notificationRequest = request
            }
        }
    }
    
    func cancelScheduledNotification() {
        guard let identifier = notificationRequest?.identifier else {
            return
        }
        
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // Reagendar a notificação para o próximo dia
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 86400, repeats: false)
        let content = response.notification.request.content
        let request = UNNotificationRequest(identifier: notificationIdentifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Erro ao reagendar a notificação: \(error.localizedDescription)")
            }
        }
        
        completionHandler()
    }
}
