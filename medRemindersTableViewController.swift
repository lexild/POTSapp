//
//  medRemindersTableViewController.swift
//  potsApptest
//
//  Created by Lexi on 02/04/2016.
//  Copyright © 2016 LexiTechsy. All rights reserved.
//

import UIKit
import CoreData

var medications = [NSManagedObject]()


class medRemindersTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // allows display of Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.navigationController?.navigationBar.hidden = false
        
        title = "Medication Reminders"
        
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Medicine")
        
        //queries CoreData with above query and assigns result to medications array.
        do {
            let results =
                try managedContext.executeFetchRequest(fetchRequest)
            medications = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return medications.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("medReminderCell")! as UITableViewCell
        
        let medication = medications[indexPath.row]
        
        cell.textLabel?.text = (medication.valueForKey("name") as? String)! + " (" + (medication.valueForKey("dose") as? String)! + ")"
        
        if (medication.valueForKey("remindersActivated") as? Bool)!==true
        {
            cell.detailTextLabel?.text = "ON"
            cell.detailTextLabel?.textColor = UIColor.greenColor()
        }
        else
        {
            cell.detailTextLabel?.text = "OFF"
            cell.detailTextLabel?.textColor = UIColor.redColor()
        }
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        switch editingStyle {
        case .Delete:
            // removes deleted item from the model
            let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let context:NSManagedObjectContext = appDel.managedObjectContext
            context.deleteObject(medications[indexPath.row] )
            medications.removeAtIndex(indexPath.row)
            do {
                try context.save()
            } catch _ {
            }
            
            // removes deleted item from (Table)View
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        default:
            return
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "medDetail" {
            let destinationViewController = segue.destinationViewController as? medSettingsDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow!
            let selectedMed :String = (medications[indexPath.row].valueForKey("name") as? String!)!
            destinationViewController!.selectedMedication = selectedMed
                    }
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


