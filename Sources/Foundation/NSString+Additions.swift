//
//  NSString+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 20.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Color And Fonts
public extension NSString {
    
    /// Changing fonts and text color
    ///
    /// - Parameters:
    ///   - fonts: The first is the currently used font, the second is the desired font.
    ///   - color: Changing text color.
    /// - Returns: NSMutableAttributedString
    @objc func setFonts(_ fonts: [UIFont: UIFont], textColor color: UIColor?) -> NSMutableAttributedString? {
        guard let data = data(using: String.Encoding.unicode.rawValue),
              let attributedString = try? NSMutableAttributedString(data: data,
                                                                    options: [
                                                                        .documentType: NSMutableAttributedString.DocumentType.html],
                                                                    documentAttributes: nil)
        else { return nil }
        
        let attributedStringRange = NSRange(location: 0, length: attributedString.length)
        
        attributedString.beginEditing()
        attributedString.enumerateAttribute(.font,
                                            in: attributedStringRange,
                                            options: [], using: { value, range, _ in
                                                if let font = value as? UIFont {
                                                    // if current font name same as desired to change font.
                                                    for (key, value) in fonts where font.fontName == key.fontName {
                                                        attributedString.addAttribute(.font, value: value, range: range)
                                                    }
                                                }
                                            })
        
        if let color = color {
            attributedString.enumerateAttribute(.foregroundColor,
                                                in: attributedStringRange,
                                                options: []) { (value, range, _) in
                if value != nil {
                    attributedString.addAttribute(.foregroundColor, value: color, range: range)
                }
            }
        }
        attributedString.endEditing()
        return attributedString
    }
}
