//
//  UIView+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 21.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import UIKit

// MARK: - UIView Tap Gesture Helpers
public extension UIView {
    
    // In order to create computed properties for extensions, we need a key to
    // store and access the stored property
    private struct AssociatedObjectKeys {
        static var tapGestureRecognizer = "TapGestureObjectKey"
    }
    
    private typealias Action = (() -> Void)
    
    // Set our computed property type to a closure
    private var tapGestureRecognizerAction: Action? {
        set {
            if let newValue = newValue {
                // Computed properties get stored as associated objects
                objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        }
        get {
            let tapGestureRecognizerActionInstance = objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer) as? Action
            return tapGestureRecognizerActionInstance
        }
    }
    
    // This is the meat of the sauce, here we create the tap gesture recognizer and
    // store the closure the user passed to us in the associated object we declared above
    func addTapGestureRecognizer(_ action: (() -> Void)?) {
        if let action = action {
            self.isUserInteractionEnabled = true
            self.tapGestureRecognizerAction = action
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
            self.addGestureRecognizer(tapGestureRecognizer)
        }
    }
    
    // Every time the user taps on the UIImageView, this function gets called,
    // which triggers the closure we stored
    @objc private func handleTapGesture(sender: UITapGestureRecognizer) {
        if let action = self.tapGestureRecognizerAction {
            action()
        }
    }
}

// MARK: - UIView Nib
public extension UIView {
    
    /// Returns UIView UINib
    var nib: UINib {
        return String(describing: type(of: self)).nib
    }
}

// MARK: - UIView Border
public extension UIView {
    
    enum ViewSide {
        case left, right, top, bottom
    }
    
    /// Adds border to view
    func addBorder(to side: ViewSide, color: UIColor, thickness: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        
        switch side {
        case .left:
            border.frame = CGRect(x: bounds.minX, y: bounds.minY, width: thickness, height: bounds.height)
        case .right:
            border.frame = CGRect(x: bounds.maxX, y: bounds.minY, width: thickness, height: bounds.height)
        case .top:
            border.frame = CGRect(x: bounds.minX, y: bounds.minY, width: bounds.width, height: thickness)
        case .bottom:
            border.frame = CGRect(x: bounds.minX, y: bounds.maxY, width: bounds.width, height: thickness)
        }
        
        layer.addSublayer(border)
    }
}


// MARK: - UIView Subviews
public extension UIView {
    
    /// Get subviews
    func subviews<T>(ofType type: T.Type) -> [T] {
        var result = [T]()
        var stack = Array(subviews.reversed())
        while stack.isNotEmpty {
            let view = stack.removeLast()
            stack.append(contentsOf: view.subviews.reversed())
            if let aView = view as? T {
                result.append(aView)
            }
        }
        return result
    }
    
    /// Removes all subviews in a view
    func removeAllSubviews() {
        self.subviews.forEach { view in
            view.removeFromSuperview()
        }
    }
}

// MARK: - UIView Helper Properties
public extension UIView {
    
    /// View's Width Getter and Setter
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
    /// View's Height Getter and Setter
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    
    /// View's Size Getter and Setter
    var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.frame.size = newValue
        }
    }
    
    /// View's CenterX Getter and Setter
    var centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            self.center.x = newValue
        }
    }
    
    /// View's CenterY Getter and Setter
    var centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            self.center.y = newValue
        }
    }
    
    /// View's Left(minX) Getter and Setter
    var left: CGFloat {
        get {
            return self.frame.minX
        }
        set {
            self.frame.origin.x = newValue
        }
    }
    
    /// View's Top(minY) Getter and Setter
    var top: CGFloat {
        get {
            return self.frame.minY
        }
        set {
            self.frame.origin.y = newValue
        }
    }
    
    /// View's Right(maxX) Getter and Setter
    var right: CGFloat {
        get {
            return self.frame.maxX
        }
        set {
            self.frame.origin.x = newValue - self.frame.size.width
        }
    }
    
    /// View's Bottom(maxY) Getter and Setter
    var bottom: CGFloat {
        get {
            return self.frame.maxY
        }
        set {
            self.frame.origin.y = newValue - self.frame.size.height
        }
    }
    
    // Position Helpers
    
    /// View's Position Getter and Setter
    var position: CGPoint {
        get {
            return self.frame.origin
        }
        set {
            self.frame.origin = newValue
        }
    }
    
    /// View's X Value Getter and Setter
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }
    
    /// View's Y Value Getter and Setter
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }
}

// MARK: - Radius to UIView
public extension UIView {
    
    /// Radius for any specifc corner
    /// - Parameters:
    ///   - corners: Corner for radius
    ///   - radius: Radius value
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

// MARK: - Animations
public extension UIView {
    
    /// Shakes a view up-down
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.y")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -4.0, 4.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}

// MARK: - Shadow
public extension UIView {
    
    /// Adds shadow to view
    /// - Parameters:
    ///   - shadowColor: Shadow Color
    ///   - radius: Shadow Radius
    ///   - opacity: Shadow Opacity
    func addShadow(shadowColor: UIColor, radius: CGFloat, opacity: Float) {
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = radius
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    /// Adds Sketch Shadow to view
    func addSketchShadow(color: UIColor = .black,
                         alpha: Float = 0.2,
                         x: CGFloat = 0,
                         y: CGFloat = 2,
                         blur: CGFloat = 4,
                         spread: CGFloat = 0) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = alpha
        layer.shadowOffset = CGSize(width: x, height: y)
        layer.shadowRadius = blur / 2
        if spread == 0 {
            layer.shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            layer.shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
