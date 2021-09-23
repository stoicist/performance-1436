//
//  FiltersOnBackgroundViewController.swift
//  performance-1436
//
//  Created by Artur Igberdin on 20.09.2021.
//

import UIKit
import CoreImage

class FiltersOnBackgroundViewController: UITableViewController {
    
    var images = [
        UIImage(named: "treeSmall")!,
        UIImage(named: "treeSmall")!,
        UIImage(named: "treeSmall")!,
        UIImage(named: "treeSmall")!,
        UIImage(named: "treeSmall")!,
        UIImage(named: "treeSmall")!,
        UIImage(named: "treeSmall")!,
        UIImage(named: "treeSmall")!,
        UIImage(named: "treeSmall")!,
        UIImage(named: "treeSmall")!,
        UIImage(named: "treeSmall")!,
        UIImage(named: "treeSmall")!,
        UIImage(named: "treeSmall")!,
        UIImage(named: "treeSmall")!,
        UIImage(named: "treeSmall")!,
        UIImage(named: "treeSmall")!,
        UIImage(named: "treeSmall")!,
        UIImage(named: "treeSmall")!,
        UIImage(named: "treeSmall")!,
        UIImage(named: "treeSmall")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blurImages()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.imageView?.image = images[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func blurImages() {
        
        var bluredImages = images
        
        //группа тасков, получаем сигнал
        let dispatchGroup = DispatchGroup()
        
        for element in bluredImages.enumerated() {
            
            DispatchQueue.global().async(group: dispatchGroup) {
                
                let inputImage = element.element
                let inputCIImage = CIImage(image: inputImage)!
                
                let blurFilter = CIFilter(name: "CIGaussianBlur", parameters: [kCIInputImageKey: inputCIImage])!
                let outputImage = blurFilter.outputImage!
                let context = CIContext()
                
                let cgiImage = context.createCGImage(outputImage, from: outputImage.extent)
                
                bluredImages[element.offset] = UIImage(cgImage: cgiImage!)
            }
            
        }
        
        //получили сигнал что выполнены все таски в группе
        dispatchGroup.notify(queue: DispatchQueue.main) {
            self.images = bluredImages
            self.tableView.reloadData()
        }
        
    }
    
    
}
