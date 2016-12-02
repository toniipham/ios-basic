//
//  ViewController.swift
//  CafePin
//
//  Created by Cam Loan on 12/1/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        extFunc = ExtensionFunction()
        db.showBanner(vwBanner: vwAdMob,rootView: self)
        getData()
        
        tblBaiHat.delegate = self
        tblBaiHat.dataSource = self
        
        tblBaiHat.estimatedRowHeight = 80
        tblBaiHat.rowHeight = UITableViewAutomaticDimension
    }
    
    
    func getData(){
        let str = "test/test1/test2/TESTDATA"
        db.loadData(urlString: str, completion: {(data) in
            let tdValues: Dictionary<String,Any> = data as! Dictionary<String,Any>
            self.arrBaiHat.removeAll()
            for tdValue in tdValues{
                self.arrBaiHat.append(BaiHat(obj: tdValue.value))
            }
            DispatchQueue.main.async {
                
                self.tblBaiHat.reloadData()
            }
        })
        let strSort = "test/test1/test2/TESTDATA"
        db.sortByNode(urlString: strSort)
    }
    func addNewData(){
        var str = "test/test1/test2/TESTDATA"
        nodeBaiHat = db.getNewNode(urlString: str)
        str += "/\(nodeBaiHat)"
        let id = extFunc.generateID()
        let name = extFunc.getDate()
        let node = nodeBaiHat
        let dict = ["id":id,"name":name,"node":node]
        db.insertData(urlString: str, params: dict as NSDictionary)
    }
    func updateBaiHat(node: String){
        let str = "test/test1/test2/TESTDATA/\(node)"
        let id = extFunc.generateID()
        let name = extFunc.getTime()
        let dict = ["id":id,"name":name]
        db.updateData(urlString: str, params: dict as NSDictionary)
    }
    func deleteBaiHat(node: String){
        let str = "test/test1/test2/TESTDATA/\(node)"
        
        db.deleteData(urlString: str)

    }
    func deleteAll(){
        if let curIndexPath = tblBaiHat.indexPathForSelectedRow {
            arrBaiHat.remove(at: curIndexPath.row)
            let str = "test/test1/test2/TESTDATA"
            
            db.delete(urlString: str)

        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Variables
    var db: DBFIRApp = DBFIRApp()
    var arrBaiHat: Array<BaiHat> = []
    var extFunc: ExtensionFunction! = nil
    var nodeBaiHat: String = ""

    
    //MARK: OUTLET
    @IBOutlet weak var tblBaiHat: UITableView!
    @IBAction func abtnInsert(_ sender: Any) {
        nodeBaiHat = ""
        addNewData()
        
    }
    @IBAction func abtnUpdate(_ sender: Any) {
        if let curIndexPath = tblBaiHat.indexPathForSelectedRow {
            if let node = arrBaiHat[curIndexPath.row].nodeBH{
                //print(node)
                updateBaiHat(node: node)
            }
        }
    }
    @IBAction func abtnDelete(_ sender: Any) {
        if let curIndexPath = tblBaiHat.indexPathForSelectedRow {
            if let node = arrBaiHat[curIndexPath.row].nodeBH{
                //print(node)
                deleteBaiHat(node: node)
            }
        }
    }
    @IBAction func abtnDeleteAll(_ sender: Any) {
        deleteAll()
    }
    // admob
    @IBOutlet weak var vwAdMob: GADBannerView!
    

}
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrBaiHat.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_01") as! TableViewCell_01
        cell.lblID.text = arrBaiHat[indexPath.row].idBH
        cell.lblName.text = arrBaiHat[indexPath.row].tenBH
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            arrBaiHat.remove(at: indexPath.row)
            if let node = arrBaiHat[indexPath.row].nodeBH{
                print(node)
                deleteBaiHat(node: node)
            }
        }
        tblBaiHat.reloadData()
    }
}
