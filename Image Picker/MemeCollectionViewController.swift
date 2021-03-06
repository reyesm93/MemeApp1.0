//
//  MemeCollectionCollectionViewController.swift
//  Image Picker
//
//  Created by Arturo Reyes on 4/22/17.
//  Copyright © 2017 Arturo Reyes. All rights reserved.
//

import UIKit
import Foundation

class MemeCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var memes: [Meme]!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        self.collectionView?.reloadData()
        print("Success at loading Collection View memes")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let space: CGFloat = 3.0
        let widthDimension = (self.view.frame.size.width - (2 * space)) / 3
        let heightDimension = (self.view.frame.size.height - (2 * space)) / 3
        
        
        flowLayout.minimumLineSpacing = space
        flowLayout.minimumInteritemSpacing = space
        flowLayout.itemSize = CGSize(width: widthDimension, height: heightDimension)
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionViewCell", for: indexPath) as! MemeCollectionViewCell
        
        let meme = self.memes[(indexPath as NSIndexPath).row]
        cell.memeCellImage?.image = meme.memedImage
        print("Success at returning Collection View Cell")
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        let memeController = self.storyboard!.instantiateViewController(withIdentifier: "MemedImageVC") as! MemedImageVC
        memeController.meme = self.memes[(indexPath as NSIndexPath).row]
        
        self.navigationController!.pushViewController(memeController, animated: true)    }
}
