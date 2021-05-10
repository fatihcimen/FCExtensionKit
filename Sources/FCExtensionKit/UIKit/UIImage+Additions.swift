//
//  UIImage+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 21.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import UIKit

// MARK: - Color Image
public extension UIImage {
    
    /// Initialize UIImage with color and size
    ///
    /// - Parameters:
    ///   - color: Image color
    ///   - size: Image size
    convenience init?(color: UIColor, size: CGSize) {
        let rect = size.toRect
        
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
    
    /// Initialize UIImage from color
    ///
    /// - Parameter color: Image color
    convenience init?(color: UIColor) {
        self.init(color: color, size: CGSize(size: 1.0))
    }
    
    /// Initialize Gradient UIImage with colors and size
    ///
    /// - Parameters:
    ///   - colors: Gradient Image colors
    ///   - size: Image size
    convenience init?(colors: [UIColor], size: CGSize) {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        defer { UIGraphicsEndImageContext() }
        
        guard let context = UIGraphicsGetCurrentContext(),
              let image = UIGraphicsGetImageFromCurrentImageContext(),
              let cgImage = image.cgImage else {
            return nil
        }
        
        let space = CGColorSpaceCreateDeviceRGB()
        let cgColors = colors.map { $0.cgColor } as CFArray
        
        let locations = colors.enumerated().map { entry -> CGFloat in
            let step = 1.0 / CGFloat(max(1, colors.count - 1))
            return CGFloat(entry.offset) * step
        }
        
        guard let gradient = CGGradient(colorsSpace: space, colors: cgColors, locations: locations)
        else { return nil }
        
        let startPoint = CGPoint(x: 0, y: size.height)
        let endPoint = CGPoint(x: size.width, y: 0)
        
        context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: [])
        
        self.init(cgImage: cgImage)
    }
}
