//
//  ViewController.swift
//  potsApptest
//
//  Created by Lexi on 02/04/2016.
//  Copyright © 2016 LexiTechsy. All rights reserved.
//

import UIKit


class MyDetailsViewController: UIViewController {

    @IBOutlet weak var genderSelection: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var bedTimePicker: UIDatePicker!
    
    @IBOutlet weak var wakeUpTimePicker: UIDatePicker!
    
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
