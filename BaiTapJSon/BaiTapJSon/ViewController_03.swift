//
//  ViewController_03.swift
//  BaiTapJSon
//
//  Created by Cam Loan on 11/24/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class ViewController_03: UIViewController {

    @IBOutlet weak var tblCatNameLvl31: UITableView!
    
    var arrCatNameLvl31: Array<String> = []
    var str: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tblCatNameLvl31.delegate = self
        tblCatNameLvl31.dataSource = self
        
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
extension ViewController_03: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCatNameLvl31.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_03") as! TableViewCell_03
        //print(arrCatNameLvl31[indexPath.row])
        cell.textLabel?.text = arrCatNameLvl31[indexPath.row]
        return cell
    }
}
