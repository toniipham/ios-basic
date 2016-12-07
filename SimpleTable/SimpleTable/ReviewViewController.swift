//
//  ReviewViewController.swift
//  SimpleTable
//
//  Created by Cam Loan on 12/1/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet weak var imgBackground: UIImageView!
    
    @IBOutlet weak var vwContainer: UIView!

    @IBOutlet weak var imgReview: UIImageView!
    
    
    var restaurants: RestaurantMO?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgBackground.image = UIImage(data: restaurants?.image as! Data)
        blurBackground()
        let transform1 = CGAffineTransform.init(scaleX: 0, y: -1000)
        let transform2 = CGAffineTransform.init(translationX: 0, y: 0)
        let transform = transform1.concatenating(transform2)
        vwContainer.transform = transform
    }
    override func viewDidAppear(_ animated: Bool) {
//        UIView.animate(withDuration: 0.3, animations: {
//            self.vwContainer.transform = CGAffineTransform.identity
//        }, completion: nil)
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0.2, options: .curveEaseInOut, animations: {
                        self.vwContainer.transform = CGAffineTransform.identity
        }, completion: nil)
        
        imgReview.image = UIImage(data: restaurants?.image as! Data)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func blurBackground(){
        let blur = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.frame = view.bounds
        imgBackground.addSubview(blurView)
    }

}
