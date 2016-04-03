//
//  Reminder.swift
//  potsApptest
//
//  Created by Lexi on 03/04/2016.
//  Copyright © 2016 LexiTechsy. All rights reserved.
//

import UIKit

class Reminder: NSObject {
    
    let title:String = ""
    let frequency:NSDateComponents=NSDateComponents()
    var activated:Bool = false
    var onWakeUp:Bool = false
    var atBedTime:Bool = false
    
    func createNotification(title:String, frequency:NSDateComponents, activated:Bool, onWakeUp:Bool, atBedTime:Bool) ->Bool{
        //do creation of notification - to be implemented by subclasses.
        return false
    }
}

