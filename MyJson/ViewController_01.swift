//
//  ViewController_01.swift
//  MyJson
//
//  Created by Cam Loan on 11/25/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class ViewController_01: UIViewController {

    var str = ""
    var arrBaiHoc: Array<String> = []
    var arrLinkBaiHoc: Array<String> = []
    
    @IBOutlet weak var tblBaiHoc: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = str
       
        tblBaiHoc.delegate = self
        tblBaiHoc.dataSource = self
        tblBaiHoc.rowHeight = UITableViewAutomaticDimension
        tblBaiHoc.estimatedRowHeight = 100
        tblBaiHoc.reloadData()
    }
}
extension ViewController_01: UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrBaiHoc.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_02") as! TableViewCell_02
        cell.lblBaiHoc.text = arrBaiHoc[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
