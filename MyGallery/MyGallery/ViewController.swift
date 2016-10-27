//
//  ViewController.swift
//  MyGallery
//
//  Created by Cam Loan on 10/27/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtImagePath: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    var arrImgName: Array<String> = []
    var index: Int = 0
    
    @IBAction func abtnOnline(_ sender: AnyObject) {
        let urlImgName: String? = txtImagePath.text
        if let urlImgName = urlImgName {
        do
        {
            let urlImage: URL? = URL(string: urlImgName)
            if let urlImage = urlImage
            {
                let data: Data = try Data(contentsOf: urlImage)
                imgView.image = UIImage(data: data)
            }else{
                txtImagePath.becomeFirstResponder()
                txtImagePath.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
                txtImagePath.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
        }catch{}
        }else{
            txtImagePath.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        }
    }
    @IBAction func abtnRandom(_ sender: AnyObject) {
        let rd = Int(arc4random())
        
        let imgName = arrImgName[rd%arrImgName.count]
        imgView.image = UIImage(named: imgName)
    }
    @IBAction func abtnBack(_ sender: AnyObject) {
        index -= 1
        if index == -1
        {
            index = arrImgName.count - 1

        }
        let imgName = arrImgName[index]
        imgView.image = UIImage(named: imgName)
    }
    @IBAction func abtnNext(_ sender: AnyObject) {
        index += 1
        if index == arrImgName.count
        {
            index = 0
        }
        let imgName = arrImgName[index]
        imgView.image = UIImage(named: imgName)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // goi hinh anh
        //imgView.image = UIImage(named: "puppy1")
        imgView.contentMode = UIViewContentMode.scaleAspectFill
        //imgView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        imgView.clipsToBounds = true
        //let radius = imgView.frame.size.height
        //print("Radius: \(radius) in viewdidload")
        for i in 1...10
        {
            arrImgName.append("Dead (\(i))")
        }
                imgView.image = UIImage(named: arrImgName[0])
    }
    override func viewDidAppear(_ animated: Bool) {
        let radius = imgView.frame.size.height/2
        //print("Radius: \(radius*2) in viewdidappear")
        imgView.layer.cornerRadius = radius
        //imgView.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

