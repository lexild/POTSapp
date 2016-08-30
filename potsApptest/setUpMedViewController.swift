//
//  setUpMedViewController.swift
//  POTSapp
//
//  Created by Lexi on 29/08/2016.
//  Copyright © 2016 LexiTechsy. All rights reserved.
//

import UIKit
import CoreData

class setUpMedViewController: UIViewController {

    
    @IBOutlet var name: UITextField!
    @IBOutlet var dose: UITextField!
    @IBOutlet var allRemindersSwtich: UISwitch!
    @IBOutlet var bedtimeSwitch: UISwitch!
    @IBOutlet var waketimeSwitch: UISwitch!
    @IBOutlet var atFrequencySwitch: UISwitch!
    @IBOutlet var hoursField: UITextField!
    @IBOutlet var minutesField: UITextField!
    @IBOutlet var specificTimesSwitch: UISwitch!
    @IBOutlet var bedTimeLabel: UILabel!
    @IBOutlet var waketimeLabel: UILabel!
    @IBOutlet var minLabel: UILabel!
    @IBOutlet var hourLabel: UILabel!
    @IBOutlet var everyLabel: UILabel!
    @IBOutlet var timesLabel: UILabel!
    
    
    @IBAction func allSwitchEdited(sender: AnyObject) {
        if allRemindersSwtich.on{
            bedtimeSwitch.enabled = true
            bedTimeLabel.enabled = true
            waketimeSwitch.enabled = true
            waketimeLabel.enabled = true
            atFrequencySwitch.enabled = true
            everyLabel.enabled = true
            hourLabel.enabled = true
            minLabel.enabled = true
            timesLabel.enabled = true
            specificTimesSwitch.enabled = true
            
        } else {
            bedtimeSwitch.enabled = false
            bedtimeSwitch.setOn(false, animated: true)
            bedTimeLabel.enabled = false
            waketimeSwitch.enabled = false
            waketimeSwitch.setOn(false, animated: true)
            waketimeLabel.enabled = false
            atFrequencySwitch.enabled = false
            atFrequencySwitch.setOn(false, animated: true)
            everyLabel.enabled = false
            hourLabel.enabled = false
            minLabel.enabled = false
            timesLabel.enabled = false
            specificTimesSwitch.enabled = false
            specificTimesSwitch.setOn(false, animated: true)
        }
        
        
    }
    
    

    @IBAction func saveMedication(sender: AnyObject) {
        
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        
        let entity =  NSEntityDescription.entityForName("Medicine",
                                                        inManagedObjectContext:managedContext)
        
        let medication = NSManagedObject(entity: entity!,
                                     insertIntoManagedObjectContext: managedContext)
        
        
        medication.setValue(name.text, forKey: "name")
        medication.setValue(dose.text, forKey: "dose")
        medication.setValue(allRemindersSwtich.on, forKey: "remindersActivated")
        medication.setValue(bedtimeSwitch.on, forKey: "atBedtime")
        medication.setValue(waketimeSwitch.on, forKey: "onWakeUp")
        medication.setValue(atFrequencySwitch.on, forKey: "atFrequency")
        medication.setValue(specificTimesSwitch.on, forKey: "atTimes")
        
        
        do {
            try managedContext.save()
            
            medications.append(medication)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        //requests notification manager to manage notifications for the relevant settings
        notificationManager.manageNotificationsForMedicine(name.text!, allRemindersOn: allRemindersSwtich.on, atBedtime: bedtimeSwitch.on, atWakeUp: waketimeSwitch.on, atFrequency: atFrequencySwitch.on, atTimes: specificTimesSwitch.on, timeList: NSSet(), frequency: NSDate())
        
        self.navigationController?.popViewControllerAnimated(true)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /**
     * Called when 'return' key pressed. return NO to ignore.
     */
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    /**
     * Called when the user click on the view (outside the UITextField).
     */
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
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
