//
//  ViewController.swift
//  PerfectClick
//
//  Created by Quratuain on 2/6/17.
//  Copyright © 2017 Quratuain. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate {
var dataSoucrce=[1,2,3,4,5,6]
    var CIFilterNames = [
        "CIPhotoEffectChrome",
        "CIPhotoEffectFade",
        "CIPhotoEffectInstant",
        "CIPhotoEffectNoir",
        "CIPhotoEffectProcess",
        "CIPhotoEffectTonal",
        "CIPhotoEffectTransfer",
        "CISepiaTone"
    ]
    
let reuseIdentifier="FilterCellIdentifier"
    @IBOutlet weak var filtersCollectionView: UICollectionView!
    
    @IBOutlet weak var originalImage: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("datasource count is \(CIFilterNames.count)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - UICollectionViewDataSource
        //1
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 1
        }
        
        //2
    func collectionView(_ collectionView: UICollectionView,
                                     numberOfItemsInSection section: Int) -> Int {
            return  CIFilterNames.count
        }
        
        //3
    func collectionView(_ collectionView: UICollectionView,
                                     cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCellIdentifier", for: indexPath) as! FilterCell
            cell.backgroundColor = UIColor.black
            // Configure the cell
        
        // Create filters for each button
        let ciContext = CIContext(options: nil)
        let originalImage1=UIImage(named: "cover")
        let coreImage = CIImage(image: originalImage1!)
        let filter = CIFilter(name: "\(CIFilterNames[indexPath.row])" )
        filter!.setDefaults()
        filter!.setValue(coreImage, forKey: kCIInputImageKey)
        let filteredImageData = filter!.value(forKey: kCIOutputImageKey) as! CIImage
        let filteredImageRef = ciContext.createCGImage(filteredImageData, from: filteredImageData.extent)
        cell.image.image = UIImage(cgImage: filteredImageRef!);
            return cell
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
        let ciContext = CIContext(options: nil)
        let originalImage1=UIImage(named: "cover")
        let coreImage = CIImage(image: originalImage1!)
        let filter = CIFilter(name: "\(CIFilterNames[indexPath.row])" )
        filter!.setDefaults()
        filter!.setValue(coreImage, forKey: kCIInputImageKey)
        let filteredImageData = filter!.value(forKey: kCIOutputImageKey) as! CIImage
        let filteredImageRef = ciContext.createCGImage(filteredImageData, from: filteredImageData.extent)
        originalImage.image = UIImage(cgImage: filteredImageRef!);
        
        originalImage.image=UIImage(cgImage: filteredImageRef!);
        
        let stringTest="test variable"
        
        print("test string is \(stringTest)")
        
    }

}

