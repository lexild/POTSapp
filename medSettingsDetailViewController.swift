//
//  medSettingsDetailViewController.swift
//  potsApptest
//
//  Created by Lexi on 02/04/2016.
//  Copyright © 2016 LexiTechsy. All rights reserved.
//

import UIKit
import CoreData

class medSettingsDetailViewController: UIViewController {

    var selectedMedication :String?

    @IBOutlet var allRemindersSwitch: UISwitch!
    @IBOutlet var bedtimeSwitch: UISwitch!
    @IBOutlet var bedtimeLabel: UILabel!
    @IBOutlet var waketimeSwitch: UISwitch!
    @IBOutlet var minutesField: UITextField!
    @IBOutlet var atFrequencySwitch: UISwitch!
    @IBOutlet var waketimeLabel: UILabel!
    @IBOutlet var everyLabel: UILabel!
    @IBOutlet var timesLabel: UILabel!
    @IBOutlet var specificTimesSwitch: UISwitch!
    @IBOutlet var hoursField: UITextField!
    @IBOutlet var minLabel: UILabel!
    @IBOutlet var hourLabel: UILabel!

    @IBOutlet var timesList: UILabel!
    @IBOutlet var editTimesButton: UIButton!

    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedMedication! + " Reminders"
        // Load from CoreData
        fetchSettings()
    }
    
    override func viewWillDisappear(animated: Bool) {
        // Save to CoreData
        saveMedication()
        //Notif
       
    }

    
    func fetchSettings() {
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Medicine")
        fetchRequest.predicate = NSPredicate(format: "name == %@", selectedMedication!)
        //queries CoreData with above query and assigns result to medication, before setting view
        //to reflect info returned by model.
        do {
            let results =
                try managedContext.executeFetchRequest(fetchRequest)
            let medication = results[0] as! NSManagedObject
            showSettings(medication)
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
            
        }
        
        
        

    }
    
    func showSettings(medication: NSManagedObject) {
        
        let remActive = medication.valueForKey("remindersActivated") as? Bool
        if remActive != false {
            allRemindersSwitch.setOn(true, animated: false)
            bedtimeSwitch.setOn((medication.valueForKey("atBedtime") as? Bool)!, animated: false)
            waketimeSwitch.setOn((medication.valueForKey("onWakeUp") as? Bool)!, animated: false)
            atFrequencySwitch.setOn((medication.valueForKey("atFrequency") as? Bool)!, animated: false)
            specificTimesSwitch.setOn((medication.valueForKey("atTimes") as? Bool)!, animated: false)
        } else {
            allRemindersSwitch.setOn(false, animated: false)
            allRSwitchedOff(self)
        }
        
    }
    
    
    func saveMedication() {
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Medicine")
        fetchRequest.predicate = NSPredicate(format: "name == %@", selectedMedication!)
        //queries CoreData with above query and assigns result to medication and
        //then re-saves all values to existing entity
        //??Room for threading errors in real world
        var medication :NSManagedObject
        
        do {
            let results =
                try managedContext.executeFetchRequest(fetchRequest)
            medication = results[0] as! NSManagedObject
            medication.setValue(allRemindersSwitch.on, forKey: "remindersActivated")
            medication.setValue(bedtimeSwitch.on, forKey: "atBedtime")
            medication.setValue(waketimeSwitch.on, forKey: "onWakeUp")
            medication.setValue(atFrequencySwitch.on, forKey: "atFrequency")
            medication.setValue(specificTimesSwitch.on, forKey: "atTimes")
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
            
        }

        do {
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        //requests notification manager to manage notifications for the relevant settings
        notificationManager.manageNotificationsForMedicine(selectedMedication!, allRemindersOn: allRemindersSwitch.on, atBedtime: bedtimeSwitch.on, atWakeUp: waketimeSwitch.on, atFrequency: atFrequencySwitch.on, atTimes: specificTimesSwitch.on, timeList: NSSet(), frequency: NSDate())

    }
    
    
    @IBAction func allRSwitchedOff(sender: AnyObject) {
        if allRemindersSwitch.on{
            bedtimeSwitch.enabled = true
            bedtimeLabel.enabled = true
            waketimeSwitch.enabled = true
            waketimeLabel.enabled = true
            atFrequencySwitch.enabled = true
            everyLabel.enabled = true
            hourLabel.enabled = true
            minLabel.enabled = true
            timesLabel.enabled = true
            specificTimesSwitch.enabled = true
            editTimesButton.enabled = true
            timesList.text = "10:00, 13:15, 18:25"
            
        } else {
            bedtimeSwitch.enabled = false
            bedtimeSwitch.setOn(false, animated: true)
            bedtimeLabel.enabled = false
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
            editTimesButton.enabled = false
            timesList.text = ""
        }

        
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
