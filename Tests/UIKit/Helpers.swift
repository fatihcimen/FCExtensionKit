//
//  Helpers.swift
//  FCExtensionKitTests
//
//  Created by Fatih Çimen on 5.12.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

import UIKit

/// Compare 2 colors
internal func compareColors (firstColor: UIColor?, secondColor: UIColor?) -> Bool {
    guard let firstColor = firstColor, let secondColor = secondColor else { return false }
    
    var red:CGFloat = 0
    var green:CGFloat  = 0
    var blue:CGFloat = 0
    var alpha:CGFloat  = 0
    firstColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    
    var red2:CGFloat = 0
    var green2:CGFloat  = 0
    var blue2:CGFloat = 0
    var alpha2:CGFloat  = 0
    secondColor.getRed(&red2, green: &green2, blue: &blue2, alpha: &alpha2)
    
    return (Int(red*255) == Int(red2*255)) && (Int(blue*255) == Int(blue2*255)) && (Int(green*255) == Int(green2*255))
}
