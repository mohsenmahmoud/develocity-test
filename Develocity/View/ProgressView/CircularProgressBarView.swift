//
//  CircularProgressBarView.swift
//  Test Progress Bar
//
//  Created by Ahmed Soultan on 19/06/2022.
//

import UIKit

class CircularProgressBarView:UIView
{
    
    // MARK: - Properties -
    
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private var startPoint = CGFloat(-Double.pi / 2)
    private var endPoint = CGFloat(3 * Double.pi / 2)
    var radius: CGFloat?
    var value : NSNumber?
    var circuleColor: CGColor?
    var strokeColor: CGColor?
    var lineWidth: CGFloat?
    
    init(frame: CGRect , radius: CGFloat , value: NSNumber , circuleColor: CGColor , strokeColor: CGColor , lineWidth: CGFloat) {
        self.radius = radius
        self.value = value
        self.circuleColor = circuleColor
        self.strokeColor = strokeColor
        self.lineWidth = lineWidth
        super.init(frame: frame)
        createCircularPath()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createCircularPath()
    }
    
    func createCircularPath() {
        // created circularPath for circleLayer and progressLayer
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width, y: frame.size.height), radius: CGFloat(radius!), startAngle: startPoint, endAngle: endPoint, clockwise: true)
        // circleLayer path defined to circularPath
        circleLayer.path = circularPath.cgPath
        // ui edits
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = self.lineWidth ?? 7
        circleLayer.strokeEnd = 1.0
        circleLayer.strokeColor = self.strokeColor ?? UIColor.clear.cgColor
        // added circleLayer to layer
        layer.addSublayer(circleLayer)
        // progressLayer path defined to circularPath
        progressLayer.path = circularPath.cgPath
        // ui edits
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = self.lineWidth ?? 7
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = self.circuleColor ?? UIColor.orange.cgColor
        // added progressLayer to layer
        layer.addSublayer(progressLayer)
    }
    
    func progressAnimation(duration: TimeInterval) {
        // created circularProgressAnimation with keyPath
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        // set the end time
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = value
        value =  (circularProgressAnimation.toValue as? NSNumber)!
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
}
