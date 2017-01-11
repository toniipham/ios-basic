//
//  ViewController.swift
//  imagegcd
//
//  Created by Cam Loan on 1/11/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    ///MARK: Layout
    @IBOutlet weak var imgGirls: UIImageView!
    @IBOutlet weak var indWaiting: UIActivityIndicatorView!
    
    @IBAction func abtnNextGirl(_ sender: Any) {
        let number = Int(arc4random_uniform(10))
        getImage(imgNo: number)
        print(number)
    }
    
    var cachedImages: NSCache<AnyObject, AnyObject> = NSCache()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        indWaiting.stopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /// MARK: get and retrieve images from URL
    // fetch online images
    func fetchImgFromURL(imgURL: URL){
        DispatchQueue.global(qos: .userInitiated).async {
            
            let fetchData = NSData(contentsOf: imgURL as URL)
            guard let img: UIImage = UIImage(data: fetchData as! Data) else{
                print("File Not Found")
                self.indWaiting.stopAnimating()
                return
            }
            
            if self.cachedImages.object(forKey: "imgURL" as AnyObject) as? UIImage == img{
                self.indWaiting.stopAnimating()
                self.imgGirls.image = self.cachedImages.object(forKey: "imgURL" as AnyObject) as? UIImage
            }else{
                DispatchQueue.main.async {
                
                    self.cachedImages.setObject(img as AnyObject, forKey: "imgURL" as AnyObject)
                self.indWaiting.stopAnimating()
                self.imgGirls.image = img
                }
            }
            
            // update ui through main queue
//            DispatchQueue.main.async {
//                if let img = fetchData{
//                    self.indWaiting.stopAnimating()
//                    self.imgGirls.image = UIImage(data: img as Data)
//                }
//            }
        }
    }
    // get image from url
    func getImage(imgNo: Int){
        indWaiting.startAnimating()
        var imageURL = URL(string: "")
        switch imgNo {
        case 0: imageURL = URL(string: "https://goo.gl/8q08OP")
        case 1: imageURL = URL(string: "https://goo.gl/cc23OE")
        case 2: imageURL = URL(string: "https://goo.gl/ZP6Bvh")
        case 3: imageURL = URL(string: "https://goo.gl/Vn9oqX")
        case 4: imageURL = URL(string: "https://goo.gl/GUxkqU")
        case 5: imageURL = URL(string: "https://goo.gl/jCLhhD")
        case 6: imageURL = URL(string: "https://goo.gl/UETU1G")
        case 7: imageURL = URL(string: "https://goo.gl/4v5RfE")
        case 8: imageURL = URL(string: "https://goo.gl/zJri4Z")
        case 9: imageURL = URL(string: "https://goo.gl/uQwgoy")
        default: break
        }
        fetchImgFromURL(imgURL: imageURL!)
        
        
    }

}

