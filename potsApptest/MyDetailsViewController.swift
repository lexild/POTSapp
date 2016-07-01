//
//  ViewController.swift
//  potsApptest
//
//  Created by Lexi on 02/04/2016.
//  Copyright © 2016 LexiTechsy. All rights reserved.
//

import UIKit


class MyDetailsViewController: UIViewController {

    @IBOutlet var genderSelection: UISegmentedControl!

    @IBOutlet var wakeUpTimePicker: UIDatePicker!

    @IBOutlet var bedTimePicker: UIDatePicker!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /* loads NSUD values unless first run */
        if userDefs.objectForKey("wake") != nil {
            wakeUpTimePicker.setDate(userDefs.objectForKey("wake") as! NSDate, animated: true)}
        if userDefs.objectForKey("bed") != nil {
            bedTimePicker.setDate(userDefs.objectForKey("bed") as! NSDate, animated: true)}
        if userDefs.objectForKey("gender") != nil {
            genderSelection.selectedSegmentIndex = userDefs.objectForKey("gender") as! Int}
    }
    

    /* saves values to NSUD when leave screen */
    override func viewWillDisappear(animated: Bool) {
        let wakeTime = wakeUpTimePicker.date
        userDefs.setObject(wakeTime, forKey:"wake")
        
        let bedTime = bedTimePicker.date
        userDefs.setObject(bedTime, forKey:"bed")
        
        let gender = genderSelection.selectedSegmentIndex
        userDefs.setObject(gender, forKey: "gender")
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}
