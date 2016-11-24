//
//  ViewController.swift
//  BaiTapJSon
//
//  Created by Cam Loan on 11/24/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblCategory: UITableView!
    
    var arrCatName: Array<String> = []
    var arrCatID: Array<Int> = []
    var arrCatName3: Array<String> = []
    var arrPCatID: Array<Int> = []
    var arrCatName4: Array<String> = []
    var dictCatName3 = [String:String]()
    var arrTemp: Array<String> = []
    var catName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url: URL = URL(string: "http://iosapp.pe.hu/baitap.json")!
        do {
            let data: Data = try Data(contentsOf: url)
            //print(data)
            let obj: Dictionary<String,AnyObject>  = try JSONSerialization.jsonObject(with: data, options: .allowFragments)  as! Dictionary<String, AnyObject>
            //print(obj)
            let result: Array<Dictionary<String,AnyObject>> = obj["result"] as! Array<Dictionary<String,AnyObject>>
//            print(result)
            for arr in result{
                let level = arr["categoryLevel"] as! Int
                let parentId = arr["categoryParentId"] as! Int
                let catId = arr["categoryId"] as! Int
                let str = arr["categoryName"] as! String
                //print("Level: \(level) pid \(parentId) name \(str)")
                //let arrTemp = str.components(separatedBy: " | ")
                if level == 2{
                    arrCatName.append(str)
                    arrCatID.append(catId)
                }else if level == 3{
                    arrCatName3.append(str)
                    arrPCatID.append(parentId)
                }else if level == 4{
                    arrCatName4.append(str)
                }
                
            }
            //print("Name \(arrCatName) ID \(arrCatID)")
            //print("Name \(arrCatName3) ID \(arrPCatID)")
            tblCategory.delegate = self
            tblCategory.dataSource = self
            
        } catch let err as NSError {
            print(err.description)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCatName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_01") as! TableViewCell_01
        
        cell.textLabel?.text = arrCatName[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        catName = arrCatName[indexPath.row]
        
        for item in arrCatName3{
            let arr = item.components(separatedBy: " | ")
            if catName == arr[0]{
                arrTemp.append(arr[1])
            }
        }
        print(arrTemp)
        let destVC = storyboard?.instantiateViewController(withIdentifier: "VC01") as! ViewController_01
        destVC.arrCatNameLvl3 = arrTemp
        destVC.str = catName!
        self.navigationController?.pushViewController(destVC, animated: true)
        arrTemp.removeAll()
    }
}
