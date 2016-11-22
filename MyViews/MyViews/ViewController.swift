//
//  ViewController.swift
//  MyViews
//
//  Created by Cam Loan on 11/22/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.delegate = self
        tblView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var tblView: UITableView!

    let arrPokemon: Array<Array<Array<String>>> = [[["001","002"]],[["003","004","005"]],[["006","007","008"]],[["009","010"]],[["011","012","013","014","015"]]]

    let arrType: Array<String> = ["Fire","Air","Water","Earth","LesGay"]
}

extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrPokemon.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPokemon[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell_01") as! TableViewCell_01
        print(indexPath.section)
        cell.arrPhoto = arrPokemon[indexPath.section][indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrType[section]
        
    }
}
