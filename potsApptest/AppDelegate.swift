//
//  AppDelegate.swift
//  potsApptest
//
//  Created by Lexi on 31/01/2016.
//  Copyright © 2016 LexiTechsy. All rights reserved.
//

import UIKit

let userDefs = NSUserDefaults.standardUserDefaults()
//NEEDS TO BE A SINGLETON 
let notificationManager = NotificationManager()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    


    func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: Set(arrayLiteral: notificationManager.medReminderCategory, notificationManager.potsReminderCategory))
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        
        return true
    }
    
    
    //HANDLES NOTIFICATIONS RECEIVED WHILST APP IS OPEN BY DISPLAYING THE SAME INFORMATION IN AN ALERT.
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        //If app is open when notification reminder due, show in an alert view instead
        dispatch_async(dispatch_get_main_queue(), {
            let alertController = UIAlertController(title: notification.alertTitle, message: notification.alertBody, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: nil))
            alertController.addAction(UIAlertAction(title: "Snooze", style: UIAlertActionStyle.Default, handler: {action in self.handleAlertSnooze(notification)}))
            self.window?.rootViewController?.presentViewController(alertController, animated: true, completion: nil)})
    }
    
    private func handleAlertSnooze(notification: UILocalNotification) {
        notificationManager.rescheduleNotification(notification, minutes: 5.0)
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        if application.applicationIconBadgeNumber > 0 {
            application.applicationIconBadgeNumber = 0
        }
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
    }

    func isFirstLaunch()->Bool{
        let launchedBefore = userDefs.boolForKey("launchedBefore")
        if launchedBefore {
            //not first launch
            return false
        } else {
            //is first launch: set launched before Bool from F to T and return true
            userDefs.setBool(true, forKey: "launchedBefore")
            return true
        }
    }
}
    
 

