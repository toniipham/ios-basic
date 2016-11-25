//
//  ViewController.swift
//  MyJson
//
//  Created by Cam Loan on 11/24/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: OUTLET
    @IBOutlet weak var tblJSon: UITableView!
    

    var arrKhoa:Array<Dictionary<String,AnyObject>>= []
    var arrKhoaHoc: Array<String> = []
    var arrKhoaHocID: Array<Int> = []
    var arrHinhKhoaHoc: Array<String> = []
    var arrBaiHoc: Array<String> = []
    var arrLinkBaiHoc: Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let str = "http://iosapp.pe.hu/ios.json"
        
        getJSON(fromURL: str)
        
        tblJSon.delegate = self
        tblJSon.dataSource = self
        tblJSon.rowHeight = UITableViewAutomaticDimension
        tblJSon.estimatedRowHeight = 110
        
        // MARK: NOT Async
        /*
        let url: URL = URL(string: "http://iosapp.pe.hu/ios.json")!
        do {
            let data: Data = try Data(contentsOf: url)
            
            let obj: Dictionary<String,AnyObject>  = try JSONSerialization.jsonObject(with: data, options: .allowFragments)  as! Dictionary<String, AnyObject>
            let khoahoc: Array<Dictionary<String,AnyObject>> = obj["khoahoc"]  as! Array<Dictionary<String, AnyObject>>
            for khoa in khoahoc{
                //print(khoa)
                // khoa hoc: ten va hinh
                arrKhoaHoc.append(khoa["khoa"]?["ten"] as! String)
                arrHinhKhoaHoc.append(khoa["khoa"]?["hinh"] as! String)
                arrKhoaHocID.append(khoa["khoa"]?["id"] as! Int)
                arrKhoa.append(khoa)

            }

            tblJSon.delegate = self
            tblJSon.dataSource = self
            tblJSon.rowHeight = UITableViewAutomaticDimension
            tblJSon.estimatedRowHeight = 100
            tblJSon.reloadData()
        } catch let err as NSError {
            print(err.description)
        }
        */
    }
    func getJSON(fromURL urlString: String){
        let url: URL = URL(string: urlString)!
        let request: URLRequest = URLRequest(url: url)
        let session: URLSession = URLSession.shared
        session.dataTask(with: request, completionHandler: {(data, res, err) in
            let responseStatusCode = (res as! HTTPURLResponse).statusCode
            if responseStatusCode == 200{
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
            let obj: Dictionary<String,AnyObject>  = try JSONSerialization.jsonObject(with: dataJSON, options: .allowFragments)  as! Dictionary<String, AnyObject>
            let khoahoc: Array<Dictionary<String,AnyObject>> = obj["khoahoc"]  as! Array<Dictionary<String, AnyObject>>
            for khoa in khoahoc{
                //print(khoa)
                // khoa hoc: ten va hinh
                arrKhoaHoc.append(khoa["khoa"]?["ten"] as! String)
                arrHinhKhoaHoc.append(khoa["khoa"]?["hinh"] as! String)
                arrKhoaHocID.append(khoa["khoa"]?["id"] as! Int)
                arrKhoa.append(khoa)
                
            }
        } catch let err as NSError {
            print(err.description)
        }
        DispatchQueue.main.async {
            self.tblJSon.reloadData()
        }
    }
    func getBaiHocByID(id: Int){
        
        for khoa in arrKhoa{
            let kid = khoa["khoa"]?["id"] as! Int
            if kid == id{
                // khoa hoc: ten va hinh
                let baihoc: Array<Dictionary<String,AnyObject>> = khoa["khoa"]?["vidcon"] as! Array<Dictionary<String,AnyObject>>
                for bai in baihoc{
                    arrBaiHoc.append(bai["ten"] as! String)
                    arrLinkBaiHoc.append(bai["idY"] as! String)
                    //print(bai["ten"] as! String)
                }
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowKhoaHoc"{
            let destVC = segue.destination as! ViewController_01
            let myIndexPath = self.tblJSon.indexPathForSelectedRow!
            let arr = arrKhoaHoc[myIndexPath.row].components(separatedBy: " - ")
            destVC.str = arr[0]
            let id = arrKhoaHocID[myIndexPath.row]
            getBaiHocByID(id: id)
            destVC.arrBaiHoc = arrBaiHoc
            destVC.arrLinkBaiHoc = arrLinkBaiHoc
            arrBaiHoc.removeAll()
            arrLinkBaiHoc.removeAll()
        }
    }

}
extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrKhoaHoc.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_01") as! TableViewCell_01
        cell.imageView?.loadImageOnline(urlString: arrHinhKhoaHoc[indexPath.row])
        cell.lblKhoaHoc.text = arrKhoaHoc[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
}

extension UIImageView{
    func loadImageOnline(urlString: String)
    {
        let arr = urlString.components(separatedBy: "/")
        let url: URL? = URL(string: arr[2])
        if let url = url
        {
            let queue = DispatchQueue(label: "myqueue")
            queue.async {
                do
                {
                    let data: Data = try Data(contentsOf: url)
                    print(data)
                    DispatchQueue.main.async {
                        self.image = UIImage(data: data)!
                    }
                }catch{}
            }
        }
    }
}
