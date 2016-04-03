//
//  medRemindersTableViewController.swift
//  potsApptest
//
//  Created by Lexi on 02/04/2016.
//  Copyright © 2016 LexiTechsy. All rights reserved.
//

import UIKit

class medRemindersTableViewController: UIViewController {

    
    var reminderSettings:[String:Bool] = ["Water":true, "Calf Pumps":true, "Test":false]
    
    
    
    class ViewController: UIViewController, UITableViewDelegate {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
        }
        
        let reminderOptions = [String](reminderSettings.keys)
        
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            
            return reminderOptions.count
        }
        
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("reminderSetting")! as UITableViewCell
            
            let cellTitle = reminderOptions[indexPath.row]
            cell.textLabel?.text = cellTitle
            
            if reminderSettings[cellTitle]==true
            {
                cell.detailTextLabel?.text = "ON"
                cell.detailTextLabel?.textColor = UIColor.greenColor()
            }
            else
            {
                cell.detailTextLabel?.text = "OFF"
                cell.detailTextLabel?.textColor = UIColor.redColor()
            }
            
            
            // Can be used to insert image into row... TODO... see http://www.ioscreator.com/tutorials/prototype-cells-tableview-tutorial-ios8-swift
            //var imageName = UIImage(named: [indexPath.row])
            //cell.imageView?.image = imageName
            
            return cell
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
    }
    
    
    
    /*override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        

        // Configure the cell...
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "medReminderCell")
        
        cell.textLabel?.text = "Test"
        
        return cell
        
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
