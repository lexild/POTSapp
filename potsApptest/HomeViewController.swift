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
        
        postureUpdatesManager.start()
        print("start() sent")
        
    }
    
    func scheduleLocalNotification() {
      
    }
    
  
    @IBAction func PRButtonPressed(sender: AnyObject) {
        print("pressed")
        // Creates reminder by setting a local notification
        
        
        notificationManager.createNotification(NotificationManager.ReminderType.med, title: "Midodrine", fireDate: NSDate().dateByAddingTimeInterval(5))
        notificationManager.createNotification(NotificationManager.ReminderType.pots, title: "drink up!", fireDate: NSDate().dateByAddingTimeInterval(15))
        //dismiss options?
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
