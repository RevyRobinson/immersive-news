//
//  PlayViewController.swift
//  ImmersiveNews
//
//  Created by Carlos Ibáñez on 12/21/16.
//  Copyright (c) 2016 Carlos Ibáñez. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    var titleText : String!
    var detailText : String!
    var videoId : String!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var cardboardButton: UIButton!
    @IBOutlet weak var smartphoneButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set title text and detail text
        titleLabel.text = titleText
        detailLabel.text = detailText
        cardboardButton.addTarget(self, action: #selector(PlayViewController.playVideo(_:)), for: UIControlEvents.touchUpInside)
        smartphoneButton.addTarget(self, action: #selector(PlayViewController.playVideo(_:)), for: UIControlEvents.touchUpInside)
    }
    

    func playVideo(_ sender: UIButton) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
