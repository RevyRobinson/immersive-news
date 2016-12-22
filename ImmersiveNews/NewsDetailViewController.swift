//
//  NewsDetailViewController.swift
//  ImmersiveNews
//
//  Created by Carlos Ibáñez on 12/20/16.
//  Copyright (c) 2016 Carlos Ibáñez. All rights reserved.
//

import UIKit

class NewsDetailViewController : UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    var titleText : String!
    var detailText : String!
    var videoId : String!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        titleLabel.text = titleText;
        detailLabel.text = detailText;
        
        //Configure button
        playButton.addTarget(self, action: #selector(NewsDetailViewController.playButtonPressed(_:)), for: UIControlEvents.touchUpInside)
    }
    
    func playButtonPressed(_ sender: UIButton){
        self.performSegue(withIdentifier: "play", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "play"){
            let destination : PlayViewController = segue.destination as! PlayViewController
            destination.titleText = titleText
            destination.detailText = detailText
            destination.videoId = videoId
        }
    }
}
