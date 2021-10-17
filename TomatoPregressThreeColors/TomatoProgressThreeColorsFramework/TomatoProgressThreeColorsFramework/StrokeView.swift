//
//  StrokeView.swift
//  ThreeColorProgress
//
//  Created by JimmyHarrington on 2019/03/04.
//  Copyright © 2019 JimmyHarrington. All rights reserved.
//

import UIKit

class StrokeView: UIView {
    var shapeLayer = CAShapeLayer()
    var strokeColor: UIColor // strokeColor
    var start: CGFloat
    var end: CGFloat
    var radius: CGFloat // radius
    var weight: CGFloat // weight
    
    init(frame: CGRect, strokeColor: UIColor, start: CGFloat, end: CGFloat, radius: CGFloat, weight: CGFloat){
        self.strokeColor = strokeColor
        self.start = start
        self.end = end
        self.radius = radius
        self.weight = weight
        super.init(frame: frame)
        self.isOpaque = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let bounds = self.bounds
        let centerPoint = CGPoint(x: bounds.width/2, y: bounds.height/2)
        let circlePath = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: start, endAngle: end, clockwise: true)
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = weight
        self.layer.addSublayer(shapeLayer)
    }
}
