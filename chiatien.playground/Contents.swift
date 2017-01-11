//: Playground - noun: a place where people can play

import UIKit
//
//let sotien = 700000
//var loaitien = [10000,20000,50000,200000,500000]
//
//var dictTien: Dictionary<Int,Int> = [:]
//var soto = 0
////loaitien.sort()
//for i in 0..<loaitien.count{
//    if sotien < loaitien[i]{
//        print("So tien khong du cho loai tien cao nhat \(loaitien[i])")
//    }else{
//        soto = sotien/loaitien[i]
//        dictTien.updateValue(soto, forKey: loaitien[i])
//    }
//}
//print("So tien can chia la \(sotien)\r\n")
//print("Can chia thanh cac loai sau")
//loaitien.forEach({print("Loai \($0)\r\n")})
//dictTien.forEach({print("Loai tien: \($0) co \($1) to")})
var sotien = 3878500
var menhgia = [500000,100000,10000,5000,500,1000,200000,50000]
menhgia.sort()
var dict: Dictionary<Int,Int> = [:]
var somenhgia = menhgia.count
var soto = 0
var soconlai = 0
func chiatien(sotienchia: Int){
    soconlai = sotienchia
    repeat{
    soto = soconlai/menhgia.last!
    dict[menhgia.last!] = soto
    soconlai -= (soto * menhgia.last!)
    somenhgia -= 1
    if soconlai < menhgia.last! {
        menhgia.remove(at: somenhgia)
    }
    
    }while somenhgia > 0
}
print("So tien chia \(sotien)")
chiatien(sotienchia: sotien)
let sortedKV = dict.sorted(by: {$0.0 < $0.1})
print("So to tien \(sortedKV)")
