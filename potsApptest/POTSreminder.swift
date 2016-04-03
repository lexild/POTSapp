//
//  POTSreminder.swift
//  potsApptest
//
//  Created by Lexi on 03/04/2016.
//  Copyright © 2016 LexiTechsy. All rights reserved.
//

import UIKit
import CoreMotion

enum ReminderCat {
    case Water, CalfPumps, SitDown, OutOfBed, Unassigned
}

class POTSreminder: Reminder {
    var type:ReminderCat = ReminderCat.Unassigned
    //var m7Value:CMMotionActivity = nil
    
}
