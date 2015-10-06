//
//  ImageViewExtensions.swift
//  Recipe Robot
//
//  Created by Eldon on 9/28/15.
//  Copyright (c) 2015 Linde Group. All rights reserved.
//

import AppKit

extension NSImageView {
    public func stopRobotRotate(){

        let timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "removeAnimations:", userInfo: nil, repeats: false)

        if self.layer != nil {
            let colorize = CABasicAnimation(keyPath: "opacity")
            colorize.duration = 2.0
            colorize.fromValue = 0.2
            colorize.toValue = 0.0
            colorize.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            colorize.repeatCount = 0
            colorize.autoreverses = false
            self.layer!.addAnimation(colorize, forKey: "alpha0")
            self.layer!.removeAnimationForKey("colorize")
        }
    }

    public func robotRotate(){
        if self.layer != nil {
            self.wantsLayer = true
            self.layer!.anchorPoint = CGPointMake(0.5, 0.5)

            let rotation = CABasicAnimation(keyPath:"transform")
            rotation.duration = 100.0

            let angle = CGFloat(4*M_PI)
            rotation.toValue = angle

            rotation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            rotation.valueFunction = CAValueFunction(name:kCAValueFunctionRotateZ);

            self.layer!.addAnimation(rotation, forKey: "transform.rotation.z")

            let colorize = CABasicAnimation(keyPath: "opacity")
            colorize.duration = 1
            colorize.fromValue = 0.2
            colorize.toValue = 0.4
            colorize.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            colorize.autoreverses = true
            colorize.repeatCount = FLT_MAX
            self.layer!.addAnimation(colorize, forKey: "colorize")
        }
    }


    internal func removeAnimations(timer: NSTimer){
        timer.invalidate()
        self.layer!.removeAnimationForKey("alpha0")
        self.layer!.removeAnimationForKey("transform.rotation.z")
    }
}
