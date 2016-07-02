//
//  NotificationFactory.swift
//  POTSapp
//
//  Created by Lexi on 01/07/2016.
//  Copyright © 2016 LexiTechsy. All rights reserved.
//

import UIKit

class NotificationManager {
    
    let reminderActionComplete = UIMutableUserNotificationAction()
    let reminderActionSnooze = UIMutableUserNotificationAction()
    let potsReminderCategory = UIMutableUserNotificationCategory()
    let medReminderCategory = UIMutableUserNotificationCategory()
    let appdel = UIApplication.sharedApplication()
    
    
    enum ReminderType { case pots, med }
    
    init() {
        notificationActionCreatorHelper()
    }
    
    
    
    func createNotification(type :ReminderType, title: String, fireDate :NSDate) {
        let notification = UILocalNotification()
        notification.alertTitle = title
        
        // Body of alert depends on title
        if (type == ReminderType.med) {
            notification.alertBody = "It's time to take your \(title)!"
            notification.category = "medReminderCategory"
        } else {
            notification.alertBody = "Don't forget to \(title)!"
            notification.category = "potsReminderCategory"
        }
        
        notification.alertAction = "ShowDetails"
        notification.fireDate = fireDate
        notification.timeZone = NSTimeZone.defaultTimeZone()
        notification.soundName = UILocalNotificationDefaultSoundName
        UIApplication.sharedApplication().scheduleLocalNotification(notification) // Scheduling the notification.
        print("alert created")
    }
    
    func createNotification(type :ReminderType, title: String, body: String, fireDate :NSDate) {
        let notification = UILocalNotification()
        notification.alertTitle = title
        notification.alertBody = body
        if (type == ReminderType.med) {
            notification.category = "medReminderCategory"
        } else {
            notification.category = "potsReminderCategory"
        }
        notification.alertAction = "ShowDetails"
        notification.fireDate = fireDate
        notification.timeZone = NSTimeZone.defaultTimeZone()
        notification.soundName = UILocalNotificationDefaultSoundName
        UIApplication.sharedApplication().scheduleLocalNotification(notification) // Scheduling the notification.
        print("alert created")
    }
    
    //is this required?
    func deleteNotification(){
        
    }
    
    func cancelNotificationOfCategory(notificationCategory: UIMutableUserNotificationCategory) {
        
    }
    
    //e.g. after snooze or for those that can be rescheduled for every x hours.
    func rescheduleNotification(notification: UILocalNotification, minutes: Double) {
        notification.fireDate = NSDate().dateByAddingTimeInterval(minutes * 60)
    }
    
    
    private func notificationActionCreatorHelper() {
        //creates Snooze button for reminder notifications
        reminderActionSnooze.identifier = "Snooze"
        reminderActionSnooze.title = "Snooze"
        reminderActionSnooze.activationMode = UIUserNotificationActivationMode.Background
        reminderActionSnooze.destructive = false
        reminderActionSnooze.authenticationRequired = false
        
        
        //creates Complete button for reminder notifications
        reminderActionComplete.identifier = "Done"
        reminderActionComplete.title = "Done"
        reminderActionComplete.activationMode = UIUserNotificationActivationMode.Background
        reminderActionComplete.destructive = true
        reminderActionComplete.authenticationRequired = false
        
        potsReminderCategory.identifier = "potsReminderCategory"
        potsReminderCategory.setActions([reminderActionComplete, reminderActionSnooze], forContext: UIUserNotificationActionContext.Default)
        potsReminderCategory.setActions([reminderActionComplete, reminderActionSnooze], forContext: UIUserNotificationActionContext.Minimal)
        
        
        medReminderCategory.identifier = "medReminderCategory"
        medReminderCategory.setActions([reminderActionComplete, reminderActionSnooze], forContext: UIUserNotificationActionContext.Default)
        medReminderCategory.setActions([reminderActionComplete, reminderActionSnooze], forContext: UIUserNotificationActionContext.Minimal)
        
        
        
        
        
    }

    
    
    

}
