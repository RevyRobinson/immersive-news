//
//  NewsCollectionViewCell.swift
//  ImmersiveNews
//
//  Created by Carlos Ibáñez on 12/19/16.
//  Copyright (c) 2016 Carlos Ibáñez. All rights reserved.
//

import UIKit

class NewsCollectionViewCell : UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var gradientView: UIView!
    
    let gradient : CAGradientLayer = CAGradientLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //Set the gradient
        gradient.colors = [UIColor.clear.cgColor, UIColor.white.cgColor];
        gradient.locations = [0.0, 0.75];
        gradientView.layer.insertSublayer(gradient, at: 0);
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = gradientView.bounds;
    }
    
}
