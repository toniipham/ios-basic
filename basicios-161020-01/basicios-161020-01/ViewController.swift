//
//  ViewController.swift
//  basicios-161020-01
//
//  Created by Cam Loan on 10/20/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func txtCheckingNgayThang(_ sender: AnyObject) {
        if (txtDate.text?.characters.count == 10){
            txtDate.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            btnCheckingCalc.isHidden = false
        }
        else{
            txtDate.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            btnCheckingCalc.isHidden = true
        }
    }
    
    @IBOutlet var btnCheckingCalc: UIButton!
    @IBOutlet var lblResult: UILabel!
    @IBOutlet var txtDate: UITextField!
    @IBAction func abtnCalc(_ sender: UIButton) {
        let ngaythang: String = txtDate.text!
        let kiemtra_ngaythang = Kiem_Tra_NgayThang(ngaythang: ngaythang)
        if let kiemtra_ngaythang = (kiemtra_ngaythang.0) // kt_ngaythang = kiemtra_ngaythang, tu kiem tra nen dung
        {
            let iNgay:Int = Int(kiemtra_ngaythang[0]) // neu dung thi ingay = kt_ngaythang[0]
            let iThang:Int = Int(kiemtra_ngaythang[1])
            let iNam:Int = Int(kiemtra_ngaythang[2])
            let kt = Kiem_Tra_NgayThangNam(iNgay: iNgay, iThang: iThang, iNam: iNam)
            if kt == "OK"
            {
                let thu:String = Ngay_Trong_Tuan(iDay: iNgay, iMonth: iThang, iYear: iNam)
                lblResult.text = thu
            }
            else
            {
                lblResult.text = kt
            }
        }
        else
        {
            lblResult.text = kiemtra_ngaythang.msg
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btnCheckingCalc.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func Kiem_Tra_NgayThang(ngaythang: String)-> ([Int]?,msg:String) // kiem tra cu phap kieu du lieu cua ngay thang nam
    {
        let arrNgayThang: Array<String> = ngaythang.components(separatedBy: "/")
        if (arrNgayThang.count != 3)
        {
            return (nil,"Invalid date") // thoat chuong trinh
        }
        else
        {
            if let iNgay = Int(arrNgayThang[0]), let iThang = Int(arrNgayThang[1]), let iNam = Int(arrNgayThang[2])
            {
               return ([iNgay,iThang,iNam],"")
            }
            else
            {
                return (nil,"Incorrect date")
            }
        }
    }
    func Kiem_Tra_NgayThangNam(iNgay: Int,iThang: Int,iNam: Int) -> String// kiem tra ngay thang nam hop le
    {
        let arrNormalMonth: Array<Int> = [1,3,5,7,8,10,12]
        let arrLeapMonth: Array<Int> = [4,6,9,11]
        if (iThang < 1 || iThang > 12)
        {
            return "Nhập sai tháng"
        }
        /*
        if (iNgay < 1 || iNgay > 31)
        {
            return "Nhập sai ngày"
        }
        */
        if (iNam < 0)
        {
            return "Nhập sai năm"
        }
        for i in 0 ... arrNormalMonth.count - 1
        {
            if (arrNormalMonth[i] == iThang)
            {
                if (iNgay < 1 || iNgay > 31)
                {
                    return "Tháng \(iThang) chỉ có từ 1 đến 31 ngày"
                }
            }
        }
        for j in 0 ... arrLeapMonth.count - 1
        {
            if (arrLeapMonth[j] == iThang)
            {
                if (iNgay < 1 || iNgay > 30)
                {
                    return "Tháng \(iThang) chỉ có từ 1 đến 30 ngày"
                }
            }
        }
        if (iThang == 2)
        {
            if (iNam % 4 == 0)
            {
                if (iNgay < 1 || iNgay > 29)
                {
                    return "Tháng \(iThang) của năm nhuận \(iNam) chỉ có từ 1 đến 29 ngày"
                }
            }
            else
            {
                if (iNgay < 1 || iNgay > 28)
                {
                    return "Tháng \(iThang) của năm thường \(iNam) chỉ có từ 1 đến 28 ngày"
                }
            }
        }
        return "OK"
    }
    /*
    func Kiem_Tra_NgayThang(ngaythang: String) -> String{
        let ret = "OK"
        if (ngaythang != "")
        {
            let arrNgayThang: Array<String> = ngaythang.components(separatedBy: "/")
            let iNgay = Int(arrNgayThang[0])!
            let iThang = Int(arrNgayThang[1])!
            let iNam = Int(arrNgayThang[2])! // try catch error
            if (iNgay != nil || iThang != nil || iNam != nil)
            {
                return "Nhập sai kiểu ngày tháng năm. Nhập số theo định dạng dd/mm/yyyy"
            
            if (arrNgayThang[0].characters.count > 2 && arrNgayThang[0].characters.count < 0)
            {
                return "Nhập sai ngày tháng"
            }
            else
            {
                let arrNormalMonth: Array<Int> = [1,3,5,7,8,10,12]
                let arrLeapMonth: Array<Int> = [4,6,9,11]
                if (iThang < 1 || iThang > 12)
                {
                    return "Nhập sai tháng"
                }
                if (iNgay < 1 || iNgay > 31)
                {
                    return "Nhập sai ngày"
                }
                if (iNam < 0)
                {
                    return "Nhập sai năm"
                }
                for i in 0 ... arrNormalMonth.count - 1
                {
                    if (arrNormalMonth[i] == iThang)
                    {
                        if (iNgay < 1 || iNgay > 31)
                        {
                            return "Tháng \(iThang) chỉ có từ 1 đến 31 ngày"
                        }
                    }
                }
                for j in 0 ... arrLeapMonth.count - 1
                {
                    if (arrLeapMonth[j] == iThang)
                    {
                        if (iNgay < 1 || iNgay > 30)
                        {
                            return "Tháng \(iThang) chỉ có từ 1 đến 30 ngày"
                        }
                    }
                }
                if (iThang == 2)
                {
                    if (iNam % 4 == 0)
                    {
                        if (iNgay < 1 || iNgay > 29)
                        {
                            return "Tháng \(iThang) của năm nhuận \(iNam) chỉ có từ 1 đến 29 ngày"
                        }
                    }
                    else
                    {
                        if (iNgay < 1 || iNgay > 28)
                        {
                            return "Tháng \(iThang) của năm thường \(iNam) chỉ có từ 1 đến 28 ngày"
                        }
                    }
                }
            }
        }
        }
        return ret
    }
    */
    func Tong_So_Ngay(iDay:Int,iMonth:Int,iYear:Int)-> Int
    {
        var sumdays: Int=0
        let arrNormalMonth:Array<Int>=[31,28,31,30,31,30,31,31,30,31,30,31]
        let arrLeapMonth:Array<Int>=[31,29,31,30,31,30,31,31,30,31,30,31]
        
        if (iYear%4 == 0)
        {
            for i in 1 ..< iMonth
            {
                sumdays += arrLeapMonth[i]
            }
            sumdays += iDay
        }
        else
        {
            for i in 1 ..< iMonth
            {
                sumdays += arrNormalMonth[i]
            }
            sumdays += iDay
        }
        return sumdays
    }
    func Ngay_Trong_Tuan(iDay:Int,iMonth:Int,iYear:Int) -> String
    {
        var thu:String=""
        let dicThu:Dictionary<Int,String> =  [0:"Chủ Nhật",1:"Thứ Hai", 2:"Thứ Ba",3:"Thứ Tư", 4:"Thứ Năm", 5:"Thứ Sáu",6:"Thứ Bảy"]
        let tong_ngay = Tong_So_Ngay(iDay: iDay, iMonth: iMonth, iYear: iYear)
        let ret = (((iYear - 1) + (iYear - 1)/4 - (iYear - 1)/100 + (iYear - 1)/400) + tong_ngay) % 7
        
        for (key,value) in dicThu
        {
            if (key == ret)
            {
                thu = value
                
            }
        }
        return thu
    }

}

