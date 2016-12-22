//
//  Header.swift
//  ImmersiveNews
//
//  Created by Carlos Ibáñez on 12/21/16.
//  Copyright (c) 2016 Carlos Ibáñez. All rights reserved.
//

import UIKit

class Header: UIView {

    var contentView : UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        contentView = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        contentView!.frame = bounds
        
        // Make the view stretch with containing view
        //contentView!.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(contentView!)
    }
    
    func loadViewFromNib() -> UIView! {
        
        //let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "Header", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }


}
