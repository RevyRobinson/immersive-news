//
//  ViewController.swift
//  ImmersiveNews
//
//  Created by Carlos Ibáñez on 12/19/16.
//  Copyright (c) 2016 Carlos Ibáñez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    var videoData : NSArray = []
    let youtubeSearchCommand : String = "https://www.googleapis.com/youtube/v3/search?order=date&part=snippet&channelId=UC5o45mBgT4iIBO9q-cpg5TA&maxResults=25&key=AIzaSyA3EJtSPiQmQGI7eBp_3XpCG6OjaebBphk"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Register the cell type
        let xib = UINib(nibName: "NewsCollectionViewCell", bundle: nil);
        collectionView.register(xib, forCellWithReuseIdentifier: "News");
        
        //Register the header type
        let headerXib = UINib(nibName: "Header", bundle: nil)
        collectionView.register(headerXib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header");
        
        //Configure collection
        self.automaticallyAdjustsScrollViewInsets = false;
        
        //Load the youtube videos
        loadChannelVideos()
    }
    
    func loadChannelVideos()
    {
        let url = URL(string: youtubeSearchCommand)
        
        /*let task = URLSession.shared.dataTask(with: url!, completionHandler: {(data, response, error) in
            //var error : NSError?
            //let json = try? JSONSerialization.jsonObject(with: data!)
            //self.videoData = json.value(forKey: "items") as! NSArray
            
            let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
            
            DispatchQueue.main.async(execute: {
                self.collectionView.reloadData()
            })*/
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                self.videoData = json["items"] as! NSArray
                
                DispatchQueue.main.async(execute: {
                    self.collectionView.reloadData()
                })
                
            } catch let error as NSError{
                print(error)
            }
        }
        
        task.resume()
    }
    

    // MARK: Collection View Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videoData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : NewsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "News", for: indexPath) as! NewsCollectionViewCell;

        let data : NSDictionary = (videoData[indexPath.row] as! NSDictionary).value(forKey: "snippet") as! NSDictionary
        cell.titleLabel.text = data.value(forKey: "title") as? String
        cell.detailLabel.text = data.value(forKey: "description") as? String
        cell.durationLabel.text = "1:23"
        
        //Set placeholder image and load the true image on background
        cell.mainImage.image = UIImage(named: "load")
        
        let thumbnail : NSDictionary = (data.value(forKey: "thumbnails") as! NSDictionary).value(forKey: "high") as! NSDictionary
        cell.mainImage.imageFromURL(thumbnail.value(forKey: "url") as! String)
        
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width, height: 60);
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionElementKindSectionHeader:
            return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as UICollectionReusableView;
        default:
            assert(false, "Unexpected element kind");
        }
        
    }
    
    // MARK : Collection View Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detail", sender: indexPath);
    }
    
    // MARK : Flow layout Delegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //Calculate width and substract insets
        let width : CGFloat = collectionView.bounds.width;        
        return CGSize(width: width, height: width);
    }
    
    // MARK : Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath : IndexPath = sender as! IndexPath
        let data = (videoData[indexPath.row] as! NSDictionary).value(forKey: "snippet") as! [String:Any]
        let id = (videoData[indexPath.row] as! NSDictionary).value(forKey: "id") as! [String:Any]
        let videoId : String = id["videoId"] as! String
        
        if(segue.identifier == "detail")
        {
            let newsDetail : NewsDetailViewController = segue.destination as! NewsDetailViewController
            
            newsDetail.titleText = data["title"] as? String
            newsDetail.detailText = data["description"] as? String
            newsDetail.videoId = videoId
        }
    }
}

