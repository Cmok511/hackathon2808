//
//  UIView + Extensions.swift
//  hackathon2808
//
//  Created by Денис Чупров on 28.07.2023.
//

import Foundation
import UIKit
extension UIView {
    
    func addRadius() {
        layer.cornerRadius = 8
    }
    func addRadius16() {
        layer.cornerRadius = 16
    }
    
    func addGreyBorder() {
        clipsToBounds = true
        layer.borderWidth = 1.5
        layer.borderColor = UIColor(named: "TextColor")?.cgColor
    }
    
    
    func addAccentColorBorder(borderWidth: CGFloat = 1) {
        clipsToBounds = true
        layer.borderWidth = borderWidth
        layer.borderColor = UIColor(named: "AccentColor")?.cgColor
    }
    func removeBorder() {
        layer.borderWidth = 0
        layer.borderColor = UIColor.clear.cgColor
    }
    
    func makeCircle() {
        layer.cornerRadius = self.bounds.height / 2
    }
    
    func addShadow() {
        layer.shadowColor = UIColor(red: 0.056, green: 0.105, blue: 0.217, alpha: 0.1).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 11
        layer.shadowOffset = CGSize(width: 0, height: 2)
    }
    
    func addBottomShadow() {
        layer.shadowColor = UIColor(red: 0.825, green: 0.853, blue: 0.917, alpha: 0.4).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 12
        layer.shadowOffset = CGSize(width: -2, height: 2)
    }
    
    func addTopRadius() {
        clipsToBounds = true
        layer.cornerRadius = self.bounds.height / 2
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
}
