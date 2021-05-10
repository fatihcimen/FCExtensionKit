//
//  UIImageView+Additions.swift
//  FCExtensionKit
//
//  Created by Fatih Çimen on 15.02.2021.
//  Copyright © 2021 Fatih Çimen. All rights reserved.
//

import UIKit
import Kingfisher
import KingfisherWebP

// Image Download Wrapper
public extension UIImageView {
    private var defaultOptions: KingfisherOptionsInfo? {
        return [.processor(WebPProcessor.default),
                .cacheSerializer(WebPSerializer.default),
                .transition(.fade(0.4))]
    }
    
    @objc func image(url: URL?) {
        self.kf.setImage(with: url, options: defaultOptions)
    }
    
    @objc func image(url: URL?, placeHolder: UIImage?) {
        self.kf.setImage(with: url, placeholder: placeHolder, options: defaultOptions)
    }
    
    @objc func image(url: URL?, placeHolder: UIImage?, completed: @escaping (UIImage) -> Void) {
        self.kf.setImage(with: url, placeholder: placeHolder, options: defaultOptions, completionHandler: { result in
            switch result {
            case .success(let image):
                completed(image.image)
            case .failure(let error):
                Logger.shared.log(.errorLog, message: "\(error.localizedDescription)")
            }
        })
    }
    
    @objc func image(url: URL?, placeholder: UIImage? = nil, completed: @escaping(UIImage?, Error?) -> Void) {
        self.kf.setImage(with: url, placeholder: placeholder, options: defaultOptions, completionHandler: { result in
            switch result {
            case .success(let image):
                completed(image.image, nil)
            case .failure(let error):
                Logger.shared.log(.errorLog, message: "\(error.localizedDescription)")
                completed(nil, error)
            }
        })
    }
    
    @objc func image(url: URL?, placeholderEnabled: Bool = false) {
        if placeholderEnabled {
            self.backgroundColor = UIColor(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        }else {
            self.backgroundColor = .clear
        }
        
        self.kf.setImage(with: url, placeholder: nil, options: defaultOptions, completionHandler: { result in
            switch result {
            case .success:
                if placeholderEnabled {
                    self.backgroundColor = .clear
                }
            case .failure(let error):
                Logger.shared.log(.errorLog, message: "\(error.localizedDescription)")
            }
        })
    }
    
    
    @objc func cancelDownload() {
        self.kf.cancelDownloadTask()
    }
}
