//
//  triggersViewController.swift
//  POTSapp
//
//  Created by Lexi on 31/08/2016.
//  Copyright © 2016 LexiTechsy. All rights reserved.
//

import UIKit
import CoreData

class triggersViewController: UIViewController {
    
    let triggersArray = ["Dehydration", "Temperature", "Poor sleep", "Period", "Alcohol", "Food", "Caffeine", "Infection"]
    
    var eventDate :NSDate?
    
    var symptoms :[String]?
    
    var selectedTriggers = [String]()
    
    @IBOutlet var triggersTableView: UITableView!
    
    @IBAction func recordEventClicked(sender: AnyObject) {
        
        getSelectedTriggers()
        
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        
        let entity =  NSEntityDescription.entityForName("Event",
                                                        inManagedObjectContext:managedContext)
        
        let event = NSManagedObject(entity: entity!,
                                         insertIntoManagedObjectContext: managedContext)
        
        
        event.setValue(eventDate, forKey: "timeDate")
        event.setValue(symptoms, forKey: "symptoms")
        event.setValue(selectedTriggers, forKey: "triggers")
        
        do {
            try managedContext.save()
            print(event)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.triggersTableView.allowsMultipleSelection = true
    }
    
    
    
    func getSelectedTriggers() {
        var selectedCells = [NSIndexPath]()
       
        
        if selectedCells.isEmpty{
            // Allows user not to select anything - change to notification prompting selection
            selectedTriggers.append(" ")
        } else {
            selectedCells = self.triggersTableView.indexPathsForSelectedRows!
            
            for indexPath in selectedCells {
                let cellToBeAdded = triggersTableView.cellForRowAtIndexPath(indexPath)! as UITableViewCell
                let trigger :String = (cellToBeAdded.textLabel?.text)!
                print(trigger)
                selectedTriggers.append(trigger)
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return triggersArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("multiSelectCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = triggersArray[indexPath.row]
        cell.accessoryView?.backgroundColor = UIColor.redColor()
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        triggersTableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.Checkmark
    }
    
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.None
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
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
