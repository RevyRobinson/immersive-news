//
//  ImageFromURL.swift
//  ImmersiveNews
//
//  Created by Carlos Ibáñez on 12/21/16.
//  Copyright (c) 2016 Carlos Ibáñez. All rights reserved.
//

import UIKit

extension UIImageView {
    public func imageFromURL(_ urlString: String) {
        
        URLSession.shared.dataTask(with: URL(string: urlString)!, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }}
