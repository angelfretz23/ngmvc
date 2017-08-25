//
//  ImageController.swift
//  NameThatPerson
//
//  Created by Ilias Basha on 8/24/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation
import UIKit

class ImageController {
    
    private static let cache: NSCache<NSString, UIImage> = NSCache()
    
    static func image(forURL url: String, completion: @escaping (UIImage?) -> Void) {
        
        guard let url = URL(string: url) else { fatalError("Image URL optional is nil.") }
    
        NetworkController.performRequest(for: url, httpMethod: .get) { (data, error) in
            guard let data = data,
                let image = UIImage(data: data) else {
                    DispatchQueue.main.async { completion(nil) }
                return
            }
            completion(image)
        }
    }
    
    static func imageForURL(string: String, completion: @escaping (UIImage?) -> ()){
        
        if let imageFromCache = cache.object(forKey: NSString(string: string)){
            completion(imageFromCache)
        } else {
            guard let url = URL(string: string),
                let imageData = (try? Data.init(contentsOf: url)),
                let imageFromData = UIImage(data: imageData)
                        else { completion(nil); return }
            
            cache.setObject(imageFromData, forKey: NSString(string: string))
            completion(imageFromData)
        }
    }
}
