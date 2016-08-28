//
//  PostureUpdatesManager.swift
//  POTSapp
//
//  Created by Lexi on 02/07/2016.
//  Copyright © 2016 LexiTechsy. All rights reserved.
//

import UIKit
import CoreMotion

class PostureUpdatesManager :NSObject {
    
    static let postureUpdatesSingleton = PostureUpdatesManager()
    
    var timer = NSTimer()
    var latestPosture :String = ""
    let motionManager = CMMotionManager()
    let dataProcessingQueue = NSOperationQueue.mainQueue()
    
    
    private override init() {
        super.init()
    }

    func start() {
        print("starting motion updates")
        if motionManager.deviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 15.0
            motionManager.startDeviceMotionUpdatesUsingReferenceFrame(CMAttitudeReferenceFrame.XArbitraryZVertical, toQueue: dataProcessingQueue, withHandler: {
                [weak self] (deviceMotion, error) in
                
                if (error == nil) {
                    self!.handleDeviceMotionUpdate(deviceMotion!)
                } else {
                    //TODO handle error
                }})
            }
    }
    
    
    func convertToDegrees(radians:Double) -> Double {
        return (180/M_PI) * radians
    }
    
    func handleDeviceMotionUpdate(deviceMotion:CMDeviceMotion){
        let attitude = motionManager.deviceMotion!.attitude
        let pitch = convertToDegrees(attitude.pitch)
        let z = deviceMotion.gravity.z
        var postureGuess = ""
        
        if (pitch <= 22) && (z < 0) {
            postureGuess = "Standing"
            
        } else if (pitch > 22 && pitch < 61) && (z < 0) {
            postureGuess = "Sitting"
            
        } else {
            postureGuess = "Lying down"
        }
        print("handling motion update")
        
        dispatch_async(dispatch_get_main_queue()) {
            self.receiveLatestPosture(postureGuess)
            
        }
    }

 
    
    
    //although the walking one is diff, in the core motion handler you could
    // have 'if curr.act = walking then PNM.receiveLP("walking") else do
    // nothing. Would then add a "walking" one to this.. could use switch
    // but this is ok for now?
    // TODO needs to be neatened up
    func receiveLatestPosture(newPosture :String) {
        
        if newPosture == latestPosture {
            // do nothing - keep current timer running
            //DOUBLE CHECK STRING COMPARISON IN SWIFT
            print("same posture")
            
        } else if newPosture == "Standing" {
            //stop current timer and set new timer for 2 mins
            latestPosture = newPosture
            timer.invalidate()
            //SEND A SIT DOWN NOTIFICATION/CALF P ETC.
            timer = NSTimer.scheduledTimerWithTimeInterval(2*60, target: self, selector: #selector(notify), userInfo: newPosture, repeats: false)
            print("first posture")
            
        } else if newPosture == "Sitting" {
            latestPosture = newPosture
            timer.invalidate()
            //SEND A LIE DOWN/CALF P ETC NOTIFICATION
            timer = NSTimer.scheduledTimerWithTimeInterval(30*60, target: self, selector: #selector(notify), userInfo: newPosture, repeats: false)
            
        } else if newPosture == "Lying down" {
            //then no timer/notifications required, so invalidate
            latestPosture = newPosture
            timer.invalidate()
        }
        
    }
    

    
    func notify(timer:NSTimer) {
        //forward to Notification Manager
        let posture = timer.userInfo as! String
        if posture == "Standing" {
            notificationManager.createNotification(NotificationManager.ReminderType.pots,
                                                   title: "You have been standing for two minutes!",
                                                   body: "Sit or lie down if you can, do some calf pumps and drink some water.",
                                                   fireDate: NSDate())
        } else {
            notificationManager.createNotification(NotificationManager.ReminderType.pots,
                                                   title: "You have been sitting for 30 minutes!",
                                                   body: "Move around or lie down if you can. Drink some water and do some calf pumps.",
                                                   fireDate: NSDate())
        }
        
    }


}

