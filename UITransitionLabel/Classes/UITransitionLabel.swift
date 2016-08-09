//
//  UITransitionLabel.swift
//  LabelAnimation
//
//  Created by TJQ on 16/8/7.
//  Copyright © 2016年 KiraMelody. All rights reserved.
//

import Foundation

public class UITransitionLabel: UILabel
{
    public var startNum: CGFloat?
    public var endNum: CGFloat?
    public var progress: NSTimeInterval = 0
    public var nowTime: NSTimeInterval?
    public var lastTime: NSTimeInterval?
    public var duration: NSTimeInterval? = 0
    public var format: String = "%f"
    var currentValue: CGFloat = 0
    var timer: CADisplayLink?
    public func transitFromTo(startNum: CGFloat, endNum: CGFloat)
    {
        self.startNum = startNum
        self.endNum = endNum
        if duration == 0 {
            self.duration = 5
        }
        
        self.nowTime = NSDate.timeIntervalSinceReferenceDate()
        self.lastTime = NSDate.timeIntervalSinceReferenceDate()
        self.timer = CADisplayLink(target: self, selector: #selector(UITransitionLabel.update))
        self.timer!.frameInterval = 2
        self.timer!.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)
        self.timer!.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: UITrackingRunLoopMode)
        
    }
    public func transitFromToWithDuration(startNum: CGFloat, endNum: CGFloat, duration: NSTimeInterval)
    {
        self.duration = duration
        transitFromTo(startNum, endNum: endNum)
    }
    
    func update() {
        let now = NSDate.timeIntervalSinceReferenceDate()
        self.progress += now - self.lastTime!
        self.lastTime = now
        if self.progress >= self.duration {
            self.timer = nil
        }
        self.currentValue = setCurrentValue()
        self.text = NSString(format: self.format, self.currentValue) as String
        if self.format.containsString("d") {
            self.text = NSString(format: self.format, Int (self.currentValue)) as String

        }
        
    }
    func setCurrentValue() -> CGFloat
    {
        if self.progress >= self.duration {
            return self.endNum!
        }
        let ratio = CGFloat(self.progress / self.duration!)
        return self.startNum! + ratio * (self.endNum! - self.startNum!)
    }
}