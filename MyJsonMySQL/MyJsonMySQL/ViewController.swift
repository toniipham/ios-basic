//
//  ViewController.swift
//  MyJsonMySQL
//
//  Created by Cam Loan on 11/26/16.
//  Copyright © 2016 Apple. All rights reserved.
//

struct BaiHat {
    var idBH: String = ""
    var tenBH: String = ""
    var tenBHKhongDau: String = ""
    var linkBH: String = ""
    var hinhAlbum: String = ""
    var tenCaSy: String = ""
    
    init(objBHJSON obj: AnyObject) {
        let dictBH = obj as! Dictionary<String,AnyObject>
        idBH = dictBH["idBH"] as! String
        tenBH = dictBH["tenBH"] as! String
        tenBHKhongDau = dictBH["tenBHKhongDau"] as! String
        linkBH = dictBH["linkBH"] as! String
        hinhAlbum = dictBH["hinhAlbum"] as! String
        tenCaSy = dictBH["tenCaSy"] as! String
    }
}

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtKeyword: UITextField!
    @IBOutlet weak var tblBaiHat: UITableView!

    //MARK: Find a song on textField
    @IBAction func atxtFindSong(_ sender: UITextField) {
        bhKhongDau = txtKeyword.text!
        arrTemp = arrBaiHat.filter{$0.tenBHKhongDau.contains(bhKhongDau)}
        //print(arrTemp[0].tenBH)
        tblBaiHat.reloadData()
    }
    
    
    var arrBaiHat: Array<BaiHat> = []
    let index = 0
    let number = 100
    var bhKhongDau = ""
    
    //var arrBH: Array<String> = ["abc","123","qwerty"]
    var arrTemp: Array<BaiHat> = []
    
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBAction func abtnLogin(_ sender: Any) {
        
    }
    
    @IBAction func abtnRegister(_ sender: Any) {
        let strWebsite = "http://iosapp.pe.hu/pushUsers.php"
        let exFunc = ExtensionFunction()
        let dictPara: Dictionary<String,String> = ["username":txtUsername.text!,"password":txtPassword.text!,"hoten":"abc"]
        
        exFunc.getJSONData(fromDomain: strWebsite, Params: dictPara, MethodHTTP: "post", completionHandler: {(result) in
            print("ok\r\n\(result)")
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //http://iosapp.pe.hu/getSong.php?index=1&number=1
        // get json by method get
        //let strGet = "http://iosapp.pe.hu/getSong.php?index=\(index)&number=\(number)"
        let strPost = "http://iosapp.pe.hu/getSongPost.php"
        
        //getJSON(fromURL: strGet)
        getJSON(fromURL: strPost)
        
        tblBaiHat.delegate = self
        tblBaiHat.dataSource = self
        
        txtKeyword.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
// get para by http method
    
    func getJSON(fromURL urlString: String){
        //print(urlString)
        let url: URL = URL(string: urlString)!
        var request: URLRequest = URLRequest(url: url)
        //request.httpMethod = "GET"
        
        // request for method post
        request.httpMethod = "POST"
        let param: String = "index=\(index)&number=\(number)&where\(bhKhongDau)"
        let dataParam  = param.data(using: .utf8)
        request.httpBody = dataParam
        
        let session: URLSession = URLSession.shared
        session.dataTask(with: request, completionHandler: {(data, res, err) in
            //print(data!)
            let responseStatusCode = (res as! HTTPURLResponse).statusCode
            if responseStatusCode == 200 || err == nil{
                self.extractJSON(JSONDATA: data!)
            }else{
                let alert = UIAlertController(title: "Information", message: "\(res?.description)", preferredStyle: .actionSheet)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
            
        }).resume()
    }
    func extractJSON(JSONDATA dataJSON: Data){
        do {
            //let objBH: Array<Dictionary<String,AnyObject>>  = try JSONSerialization.jsonObject(with: dataJSON, options: .allowFragments)  as! Array<Dictionary<String,AnyObject>>
            let objBH: Array<AnyObject> = try JSONSerialization.jsonObject(with: dataJSON, options: .allowFragments) as! Array<AnyObject>
//            let obj1 = try JSONSerialization.jsonObject(with: dataJSON, options: .allowFragments)
//            print(obj1)
            for obj in objBH{
                self.arrBaiHat.append(BaiHat(objBHJSON: obj))
            }
        } catch let err as NSError {
            print(err.description)
        }
        DispatchQueue.main.async {
            self.tblBaiHat.reloadData()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OpenPlayer"{
            let destVC = segue.destination as! ViewController_01
            let myIndexPath = self.tblBaiHat.indexPathForSelectedRow!
            let linkBH = arrBaiHat[myIndexPath.row].linkBH
            destVC.linkBH = linkBH
        }

    }
}
//MARK: TABLEVIEW
extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrBaiHat.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_01") as! TableViewCell_01
        cell.lblTenBH.text = arrBaiHat[indexPath.row].tenBH.uppercased()
        cell.imgPhotoBH.loadImage(urlString: arrBaiHat[indexPath.row].hinhAlbum)
        return cell
    }
    
}
extension UIImageView{
    func loadImage(urlString: String)
    {
        //let url: URL? = URL(string: urlString)
        //let str = "http://iosapp.pe.hu/\(urlString)"
        if let url = URL(string: urlString)
        {
            let queue = DispatchQueue(label: "myqueue")
            queue.async {
                do
                {
                    let data: Data = try Data(contentsOf: url)
                    DispatchQueue.main.async {
                        let image: UIImage = UIImage(data: data)!
                        self.image = image
                    }
                }catch{}
            }
        }

    }
}
