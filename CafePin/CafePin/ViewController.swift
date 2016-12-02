//
//  ViewController.swift
//  CafePin
//
//  Created by Cam Loan on 12/1/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Variables
    var db: DBFIRApp! = nil
    var arrBaiHat: Array<BaiHat> = []
    var extFunc: ExtensionFunction! = nil
    var nodeBaiHat: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        extFunc = ExtensionFunction()
        
        db = DBFIRApp()
        getData()
        
        tblBaiHat.delegate = self
        tblBaiHat.dataSource = self
        
    }

    func getData(){
        let str = "test/test1/test2/TESTDATA"
        db.loadData(urlString: str, completion: {(data) in
            let tdValues: Dictionary<String,Any> = data as! Dictionary<String,Any>
            self.arrBaiHat.removeAll()
            for tdValue in tdValues{
                self.arrBaiHat.append(BaiHat(obj: tdValue.value))
            }
        })
        DispatchQueue.main.async {
            self.tblBaiHat.reloadData()
        }
    }
    func addNewData(){
        var str = "test/test1/test2/TESTDATA"
        nodeBaiHat = db.getNewNode(urlString: str)
        str += "/\(nodeBaiHat)"
        let id = extFunc.generateID()
        let name = extFunc.getDate()
        let dict = ["id":id,"name":name]
        db.insertData(urlString: str, params: dict as NSDictionary)
    }
    func updateBaiHat(){
        let str = "test/test1/test2/TESTDATA/\(nodeBaiHat)"
        let id = extFunc.generateID()
        let name = extFunc.getTime()
        let dict = ["id":id,"name":name]
        db.updateData(urlString: str, params: dict as NSDictionary)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: OUTLET
    @IBOutlet weak var tblBaiHat: UITableView!
    @IBAction func abtnInsert(_ sender: Any) {
        nodeBaiHat = ""
        addNewData()
        
    }
    @IBAction func abtnUpdate(_ sender: Any) {
        updateBaiHat()
    }
    

}
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrBaiHat.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_01")
        cell?.textLabel?.text = arrBaiHat[indexPath.row].tenBH
        return cell!
    }
}
