//
//  ViewController.swift
//  MyGallery
//
//  Created by Cam Loan on 10/27/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sldImage: UISlider!
    @IBOutlet weak var txtImagePath: UITextField! // du tinh nhap duong dan hinh anh de hien thi khi nhap nut online
    @IBOutlet weak var imgView: UIImageView!
    var arrImgName: Array<String> = []
    var index: Int = 0
    var dicImage: Dictionary<String, UIImage> = [:] // khai bao tu dien de luu thong tin cached image
    var timer: Timer = Timer()
    
    @IBAction func abtnOnline(_ sender: AnyObject) {
        let urlImgName: String = txtImagePath.text!
        loadImageOnline(urlString: urlImgName)
        
    }
    @IBAction func abtnRandom(_ sender: AnyObject) {
        let rd: Int = Int(arc4random()) % arrImgName.count
        if dicImage["\(rd)"] != nil
        {
            imgView.image = dicImage["\(rd)"]
        }
        else
        {
            let imgName = arrImgName[rd]
            imgView.image = UIImage(named: imgName)
        }
    }
    @IBAction func abtnBack(_ sender: AnyObject) {
        index -= 1
        if index == -1
        {
            index = arrImgName.count - 1

        }
        if dicImage["\(index)"] != nil
        {
            imgView.image = dicImage["\(index)"]
        }
        else
        {
            let imgName = arrImgName[index]
            imgView.image = UIImage(named: imgName)
        }    }
    @IBAction func abtnNext(_ sender: AnyObject) {
        index += 1
        if index == arrImgName.count
        {
            index = 0
        }
        if dicImage["\(index)"] != nil
        {
            imgView.image = dicImage["\(index)"]
        }
        else
        {
            let imgName = arrImgName[index]
            imgView.image = UIImage(named: imgName)
        }
    }
    func loadImageOnline(urlString: String)
    {
        let url: URL? = URL(string: urlString)
        if let url = url
        {
            let queue = DispatchQueue(label: "myqueue")
            queue.async {
                do
                {
                    let data: Data = try Data(contentsOf: url)
                    DispatchQueue.main.async {
                        let image: UIImage = UIImage(data: data)!
                        self.imgView.image = image
                        self.dicImage["\(self.index)"] = image
                    }
                }catch{}
            }
        }else{
            txtImagePath.becomeFirstResponder()
            txtImagePath.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            txtImagePath.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    func nextAuto()
    {
        index += 1
        if index == arrImgName.count
        {
            index = 0
        }
        sldImage.value = Float(index)
        if dicImage["\(index)"] != nil
        {
            imgView.image = dicImage["\(index)"]
        }
        else
        {
            let imgName = arrImgName[index]
            imgView.image = UIImage(named: imgName)
        }
    }
    @IBAction func abtnStop(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func abtnStart(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(ViewController.nextAuto), userInfo: nil, repeats: true)
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
        sldImage.minimumValue = 0
        sldImage.maximumValue = Float(arrImgName.count)
        sldImage.value = 0
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

