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
    
    
    @IBAction func infoButtonPressed(sender: AnyObject) {
        let alertController = UIAlertController(title: "Record Event",
            message: "Use this function to record episodes when your symptoms are at their worst (e.g. a faint or severe tachycardia) and the triggers which may have caused symptoms to worsen.",
            preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        presentViewController(alertController, animated: true, completion: nil)
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
