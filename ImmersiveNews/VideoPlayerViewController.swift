//
//  VideoPlayerViewController.swift
//  ImmersiveNews
//
//  Created by Carlos Ibáñez on 12/22/16.
//  Copyright © 2016 Carlos Ibáñez. All rights reserved.
//

import UIKit

class VideoPlayerViewController: UIViewController {
    @IBOutlet var videoView: GVRVideoView!

    var videoId : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        //videoView.load(from: URL(string: "https://www.youtube.com/watch?v=" + videoId))
        videoView.load(from: URL(string: "https://s3.amazonaws.com/ray.wenderlich/elephant_safari.mp4"))
        videoView.play()
        videoView.enableFullscreenButton = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
