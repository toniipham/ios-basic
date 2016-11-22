//
//  TableViewCell_01.swift
//  MyViews
//
//  Created by Cam Loan on 11/22/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class TableViewCell_01: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //colView.dataSource = self
        //colView.delegate = self
    }
    override func layoutSubviews() {
        print(arrPhoto)
        colView.delegate = self
        colView.dataSource = self
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var colView: UICollectionView!
       
    //var arrPhoto: Array<String> = ["001","002","003","004","005","006","007","008","009","010"]
    var arrPhoto: Array<String> = []
}
extension TableViewCell_01: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrPhoto.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell_01", for: indexPath) as! CollectionViewCell_01
        
        cell.imgPhoto.contentMode = .scaleAspectFill
        cell.imgPhoto.image = UIImage(named: arrPhoto[indexPath.row])
        print("Collection View: \(indexPath.row)")
        return cell
    }
}
