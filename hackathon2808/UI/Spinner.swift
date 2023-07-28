//
//  Spinner.swift
//  hackathon2808
//
//  Created by Денис Чупров on 28.07.2023.
//

import Foundation
import UIKit

protocol SpinnerProtocol {
    func startAniamtion()
    func stopAnimation()
    func setNewColor(color: UIColor?)
}

final class Spinner: UIView, SpinnerProtocol {
    private let shapeLayer: CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        let center = CGPoint(x: 0, y: 0)
        let end = (-CGFloat.pi / 2)
        let start = -CGFloat.pi + end * 3
        let circularPath = UIBezierPath(arcCenter: center, radius: 8, startAngle: start, endAngle: end, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        shapeLayer.lineWidth = 3
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 0.6
        shapeLayer.lineCap = .round
        return shapeLayer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        layer.addSublayer(shapeLayer)
        stopAnimation()
        shapeLayer.strokeColor = UIColor(named: "AccentColor")?.cgColor
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func setNewColor(color: UIColor?) {
        shapeLayer.strokeColor = color?.cgColor
    }
    
     func startAniamtion() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0
        animation.toValue = 50
        animation.duration = 5
         animation.repeatCount = Float(Int.max)
        shapeLayer.isHidden = false
        shapeLayer.add(animation, forKey: nil)
    }
    
    func stopAnimation() {
        shapeLayer.isHidden = true
        shapeLayer.removeAllAnimations()
    }
}
