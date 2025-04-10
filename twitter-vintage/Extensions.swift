//
//  Extensions.swift
//  twitter-vintage
//
//  Created by cron on 2/11/25.
//

import UIKit

extension UIView {
    
    func setDimensions(width: CGFloat, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func center(inView view: UIView, yConstant: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yConstant!).isActive = true
    }

    func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop!).isActive = true
        }
    }
}



extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let mainBlue = UIColor.rgb(red: 29, green: 161, blue: 242)
    static let customRed = UIColor.rgb(red: 220, green: 78, blue: 65)
    static let customPurple = UIColor.rgb(red: 128, green: 87, blue: 194)
    static let twitterBlue = UIColor.rgb(red: 29, green: 161, blue: 242)
}

extension UIView {
    
    // Verifica se o teclado está ativo
    func isKeyboardActive() -> Bool {
        return UIApplication.shared.windows.first?.firstResponder != nil
    }
    
    // Fecha o teclado caso esteja ativo
    func dismissKeyboardIfActive() {
        if isKeyboardActive() {
            self.endEditing(true)
        }
    }
}

private extension UIWindow {
    var firstResponder: UIResponder? {
        return findFirstResponder(in: self)
    }
    
    func findFirstResponder(in view: UIView) -> UIResponder? {
        if view.isFirstResponder {
            return view
        }
        for subview in view.subviews {
            if let responder = findFirstResponder(in: subview) {
                return responder
            }
        }
        return nil
    }
}

extension UIView {
    func addTapAction(target: Any, action: Selector) {
           let tapGesture = UITapGestureRecognizer(target: target, action: action)
           self.isUserInteractionEnabled = true // Garante que a view possa receber toques
           self.addGestureRecognizer(tapGesture)
    }
}
