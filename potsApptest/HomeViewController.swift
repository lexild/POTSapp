//
//  homeViewController.swift
//  potsApptest
//
//  Created by Lexi on 02/04/2016.
//  Copyright © 2016 LexiTechsy. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func scheduleLocalNotification() {
      
    }
    
  
    @IBAction func PRButtonPressed(sender: AnyObject) {
        print("pressed")
        // Create reminder by setting a local notification
        let localNotification = UILocalNotification() // Creating an instance of the notification.
        localNotification.alertTitle = "Notification Title"
        localNotification.alertBody = "Alert body to provide more details"
        localNotification.alertAction = "ShowDetails"
        localNotification.fireDate = NSDate().dateByAddingTimeInterval(5) // 5 minutes(60 sec * 5) from now
        localNotification.timeZone = NSTimeZone.defaultTimeZone()
        localNotification.soundName = UILocalNotificationDefaultSoundName // Use the default notification tone/ specify a file in the application bundle
        localNotification.applicationIconBadgeNumber = 1 // Badge number to set on the application Icon.
        localNotification.category = "reminderCategory" // Category to use the specified actions
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification) // Scheduling the notification.
        print("alert created")
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
