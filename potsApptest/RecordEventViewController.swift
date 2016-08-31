//
//  RecordEventViewController.swift
//  POTSapp
//
//  Created by Lexi on 30/08/2016.
//  Copyright © 2016 LexiTechsy. All rights reserved.
//

import UIKit


class RecordEventViewController: UIViewController {

    @IBOutlet var dateTimePicker: UIDatePicker!
    let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
    
    @IBAction func homeScreenClicked(sender: AnyObject) {
        //presentViewController(home)
        let homeVC = appDel.window!.rootViewController! as UIViewController
        presentViewController(homeVC, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func nextClicked(sender: AnyObject) {
        //saveDate
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "symptomsSegue" {
            let destinationViewController = segue.destinationViewController as? symptomsViewController
            let eventDate = dateTimePicker.date
            destinationViewController!.eventDate = eventDate
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
