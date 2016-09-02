//
//  symptomsViewController.swift
//  POTSapp
//
//  Created by Lexi on 31/08/2016.
//  Copyright © 2016 LexiTechsy. All rights reserved.
//

import UIKit

class symptomsViewController: UIViewController, UITableViewDelegate {

    let symptomsArray = ["Faint", "Tachycardia", "Chest Pain", "Dizziness", "Brain Fog"]
    
    var eventDate :NSDate?
    
    var selectedSymptoms = [String]()
    
    
    @IBOutlet var symptomsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.symptomsTableView.allowsMultipleSelection = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return symptomsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("multiSelectCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = symptomsArray[indexPath.row]
        cell.accessoryView?.backgroundColor = UIColor.redColor()
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        symptomsTableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.Checkmark
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.None
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "triggersSegue" {
            let destinationViewController = segue.destinationViewController as? triggersViewController
            destinationViewController!.eventDate = eventDate
            var selectedCells = [NSIndexPath]()
 
            if selectedCells.isEmpty {
                // Allows user not to select anything - change to notification prompting selection
                selectedSymptoms.append(" ")
            } else {
                selectedCells = self.symptomsTableView.indexPathsForSelectedRows!
                
                for indexPath in selectedCells {
                    let cellToBeAdded = symptomsTableView.cellForRowAtIndexPath(indexPath)! as UITableViewCell
                    let symptom :String = (cellToBeAdded.textLabel?.text)!
                    print(symptom)
                    selectedSymptoms.append(symptom)
                }
                destinationViewController?.symptoms = selectedSymptoms
                
            }
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
