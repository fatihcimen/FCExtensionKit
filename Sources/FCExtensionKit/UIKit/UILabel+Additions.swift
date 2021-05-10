//
//  UILabel+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 22.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import UIKit

// MARK: - UILabel Animate
public extension UILabel {
    
    /// Animates UILabel with scale
    ///
    /// - Parameters:
    ///   - font: Animating with font size
    ///   - duration: Animation time
    func animate(font: UIFont, duration: TimeInterval) {
        let labelScale = self.font.pointSize / font.pointSize
        self.font = font
        let oldTransform = transform
        transform = transform.scaledBy(x: labelScale, y: labelScale)
        
        setNeedsUpdateConstraints()
        
        UIView.animate(withDuration: duration) {
            self.transform = oldTransform
            self.layoutIfNeeded()
        }
    }
}
