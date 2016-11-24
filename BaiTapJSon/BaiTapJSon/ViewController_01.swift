//
//  ViewController_01.swift
//  BaiTapJSon
//
//  Created by Cam Loan on 11/24/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class ViewController_01: UIViewController {

    var arrCatNameLvl3: Array<String> = []
    var str: String = ""
    
    @IBOutlet weak var tblCatNameLvl3: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tblCatNameLvl3.delegate = self
        tblCatNameLvl3.dataSource = self
        
        navigationItem.title = str
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ViewController_01: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCatNameLvl3.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_02") as! TableViewCell_02
        cell.textLabel?.text = arrCatNameLvl3[indexPath.row]
        return cell
    }
}
