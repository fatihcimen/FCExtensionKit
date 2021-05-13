//
//  UIImage+AdditionsTests.swift
//  FCExtensionKitTests
//
//  Created by Fatih Çimen on 25.11.2019.
//  Copyright © 2019 Fatih Çimen. All rights reserved.
//

@testable import FCExtensionKit
import XCTest

class UIImage_AdditionsTests: XCTestCase {
    
    // MARK: - Constants
    private enum Constant {
        enum Colors {
            static let redColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            static let blueColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        }
        
        enum Size {
            static let wrongImageSize = CGSize(width: 10000000, height: 10000000)
            static let imageSize = CGSize(width: 100, height: 100)
        }
        
        enum Point {
            static let point = CGPoint(x: 0.2, y: 0.2)
        }
    }
    
    // MARK: - Tests
    func testInitWithColorAndSize() {
        let imageRed = UIImage(color: Constant.Colors.redColor, size: Constant.Size.imageSize)
        let imageBlue = UIImage(color: Constant.Colors.blueColor, size: Constant.Size.imageSize)
        
        let redColor = colorOfPoint(image: imageRed, point: Constant.Point.point)
        let blueColor = colorOfPoint(image: imageBlue, point: Constant.Point.point)
        
        XCTAssertTrue(compareColors(firstColor: redColor, secondColor: Constant.Colors.redColor))
        XCTAssertTrue(compareColors(firstColor: blueColor, secondColor: Constant.Colors.blueColor))
        XCTAssertFalse(compareColors(firstColor: blueColor, secondColor: redColor))
        XCTAssertFalse(compareColors(firstColor: Constant.Colors.redColor, secondColor: Constant.Colors.blueColor))
    }
    
    func testInitWithColorAndWrongSize() {
        let image = UIImage(color: Constant.Colors.redColor, size: Constant.Size.wrongImageSize)
        
        XCTAssertNil(image)
    }
    
    func testInitWithColor() {
        let imageRed = UIImage(color: .red)
        let redColor = colorOfPoint(image: imageRed, point: Constant.Point.point)
        
        XCTAssertTrue(compareColors(firstColor: redColor, secondColor: .red))
    }
    
    func testEmptyGradientImage() {
        let emptyGradient = UIImage(colors: [], size: Constant.Size.imageSize)
        
        XCTAssertNil(emptyGradient)
    }
    
    func testGradientImageContextNil() {
        let contextNil = UIImage(colors: [], size: Constant.Size.wrongImageSize)
        
        XCTAssertNil(contextNil)
    }
    
    func testColorOfPointHelperNil() {
        let point = colorOfPoint(image: nil, point: Constant.Point.point)
        
        XCTAssertNil(point)
    }
    
    // MARK: - Helpers
    /// Get color from any position.
    private func colorOfPoint(image: UIImage?, point: CGPoint) -> UIColor? {
        guard let image = image else { return nil }
        
        var bitmap = [UInt8](repeating: 0, count: 4)
        
        // Create 1x1 context that interpolates pixels when drawing to it.
        let context = CGContext(data: &bitmap, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: CGColorSpaceCreateDeviceRGB(), bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
        let inputImage = image.cgImage ?? CIContext().createCGImage(image.ciImage!, from: image.ciImage!.extent)
        
        // Render to bitmap.
        context.draw(inputImage!, in: CGRect(x: 0, y: 0, width: 1, height: 1))
        
        let result = UIColor(red: CGFloat(bitmap[0]) / 255.0, green: CGFloat(bitmap[1]) / 255.0, blue: CGFloat(bitmap[2]) / 255.0, alpha: CGFloat(bitmap[3]) / 255.0)
        return result
    }
}
