//
//  FlatCircleLoader.swift
//  tvProgress
//
//  Created by Cédric Eugeni on 05/05/2016.
//  Copyright © 2016 tvProgress. All rights reserved.
//

import Foundation

class FlatCircleLoader: tvLoaderAnimatable {
    //MARK: - Life Cycle
    required init() {
    }
    
    func configureWithStyle(_ style: tvProgressStyle) -> (view: UIView, completion: () -> Void) {
        let v: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        let bounds = v.frame
        let rectShape = CAShapeLayer()
        rectShape.bounds = bounds
        rectShape.position = v.center
        rectShape.cornerRadius = bounds.width / 2
        v.layer.addSublayer(rectShape)
        
        rectShape.path = UIBezierPath(ovalIn: rectShape.bounds).cgPath
        rectShape.lineWidth = 7.0
        rectShape.strokeColor = style.mainColor.cgColor
        rectShape.fillColor = UIColor.clear.cgColor
        rectShape.strokeStart = 0
        rectShape.strokeEnd = 1
        
        let start = CABasicAnimation(keyPath: "strokeStart")
        start.toValue = 1
        start.beginTime = 0
        start.duration = 1
        
        let an: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        an.fromValue = 0
        an.toValue = 1
        an.beginTime = 1
        an.duration = 1
        
        let group = CAAnimationGroup()
        group.animations = [start, an]
        group.duration = 2
        group.autoreverses = false
        group.repeatCount = HUGE //infinite
        
        rectShape.add(group, forKey: nil)
        
        let completion: () -> Void = { () -> Void in
            rectShape.removeAllAnimations()
        }
        
        return (v, completion)
    }
}
