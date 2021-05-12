//
//  String+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 20.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import CommonCrypto
import UIKit

// MARK: - Date Coverters
public extension String {
    
    /// Converts date string to remaining time
    var remainingTime: String? {
        guard let dateRangeEnd = self.date() else { return nil }
        let dateRangeStart = Date()
        
        let components = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: dateRangeStart, to: dateRangeEnd)
        
        if let day = components.day, day > 0 {
            return "\(day) Gün \(components.hour ?? 00):\(components.minute ?? 00):\(components.second ?? 00)"
        }else {
            return "\(components.hour ?? 00):\(components.minute ?? 00):\(components.second ?? 00)"
        }
    }
    
    /// String Date to Date
    ///
    /// - Parameter format: Date Format
    /// - Returns: Corverted Date
    func date(format: String? = "yyyy-MM-dd'T'HH:mm:ss") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.date(from: self)
    }
}

// MARK: - String Helpers
public extension String {
    
    static let empty = ""
    static let newline = "\n"
    static let whitespace = " "
    
    var length: Int {
        return self.count
    }
    
    /// Trims Whitespaces and Newlines
    var trimmed: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// Trims trailing and leading whitespaces
    var trimmedLeadingAndLeading: String {
        return self.replacingOccurrences(of: "(^\\s+)|(\\s+)$", with: "", options: .regularExpression)
    }
    
    /// Converts String to NSString
    var ns: NSString {
        return self as NSString
    }
    
    var floatValue: Float {
        return ns.floatValue
    }
    
    var integerValue: Int {
        return ns.integerValue
    }
    
    var nib: UINib {
        return UINib(nibName: self, bundle: .main)
    }
    
    /// A Boolean value indicating whether the collection is not empty.
    var isNotEmpty: Bool {
        return length > 0
    }
    
    /// Converts formatted double
    var toDouble: Double {
        let formatter = NumberFormatter()
        formatter.decimalSeparator = ","
        let grade = formatter.number(from: self)
        
        guard let doubleGrade = grade?.doubleValue else { return 0.0 }
        return doubleGrade
    }
    
    /// Init with optional character
    /// - Parameter c: Optinal Character
    init?(_ c: Character?) {
        guard let c = c else { return nil }
        self.init(c)
    }
}

// MARK: - Crypto
public extension String {
    var sha1: String? {
        guard let data = self.data(using: .utf8) else { return nil }
        
        var hash: [UInt8] = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        
        let baseAddress = data.withUnsafeBytes { return $0.baseAddress }
        
        CC_SHA1(baseAddress, CC_LONG(data.count), &hash)
        
        return hash.map { String(format: "%02x", $0) }.joined()
    }
}

// MARK: - HTML
public extension String {
    
    /// Converts HTML to NSMutableAttributedString
    var html2AttributedString: NSMutableAttributedString? {
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [.documentType: NSAttributedString.DocumentType.html,
                                                                           .characterEncoding: String.Encoding.utf8.rawValue]
        
        guard let data = data(using: .utf8),
              let attributedString = try? NSMutableAttributedString(data: data,
                                                                    options: options,
                                                                    documentAttributes: nil) else { return nil }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        paragraphStyle.lineBreakMode = .byWordWrapping
        
        attributedString.addAttribute(.paragraphStyle,
                                      value: paragraphStyle,
                                      range: NSRange(location: 0,
                                                     length: attributedString.length))
        
        return attributedString
    }
}

// MARK: - URL Helpers
public extension String {
    
    private static let charSet = CharacterSet(charactersIn: "!*'();:@&=+$,/?%#[]^ ").inverted
    
    /// Encodes URL
    var urlEncoded: String? {
        let allowedCharacterSet = String.charSet
        
        return self.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet)
    }
    
    /// Decodes URL Spaces
    var urlDecoded: String? {
        return self.replacingOccurrences(of: "+", with: " ").removingPercentEncoding
    }
    
    /// String to URL
    var url: URL? {
        if let url = URL(string: self) {
            return url
        }
        
        var set = CharacterSet()
        set.formUnion(.urlHostAllowed)
        set.formUnion(.urlPathAllowed)
        set.formUnion(.urlQueryAllowed)
        set.formUnion(.urlFragmentAllowed)
        return self.addingPercentEncoding(withAllowedCharacters: set).flatMap { URL(string: $0) }
    }
}

// MARK: - Label
public extension String {
    /// Returns label's height
    ///
    /// - Parameters:
    ///   - width: Label's width
    ///   - font: Used font
    ///   - numberOfLines: Number of lines
    ///   - lineBreakMode: Line break mode
    /// - Returns: Height
    func getLabelHeight(width: CGFloat,
                        font: UIFont,
                        numberOfLines: Int = 0,
                        lineBreakMode: NSLineBreakMode = .byWordWrapping) -> CGFloat {
        let label = UILabel(frame: .zero)
        label.width = width
        label.numberOfLines = numberOfLines
        label.lineBreakMode = lineBreakMode
        label.font = font
        label.text = self
        label.sizeToFit()
        
        return label.height
    }
}
