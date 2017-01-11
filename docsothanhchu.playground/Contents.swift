//: Playground - noun: a place where people can play

import UIKit

var dictSo = ["0":"không","1":"một","2":"hai","3":"ba","4":"bốn","5":"năm","6":"sáu","7":"bảy","8":"tám","9":"chín"]
var hangTien = [""," nghìn", " triệu", " tỷ", " nghìn", " triệu"]

func splitedNumberString(str: String, length: Int)->[String]{
    guard length > 0 else {
        return []
    }
    let strRev = String(str.characters.reversed())
    let strCount = str.characters.count
    var groupStr: Array<String> = []
    var i = 0
    while i < strCount {
        groupStr.append((strRev as NSString).substring(with: NSRange(location: i, length: min(length, strCount - i))))
        i += length
    }
    return groupStr.map({String($0.characters.reversed())})//.reversed()
}
func convertDictNumber(num: String)->String{
    var str = ""
    dictSo.forEach({
        if $0.key.contains(num){
            str = $0.value
        }
    })
    return str
}

func docBaSo(num: Int)->String{
    var ret = " "
    let hangDonVi = num%10
    let hangChuc = (num%100)/10
    let hangTram = num/100
    if hangTram != 0{
        ret += convertDictNumber(num: String(hangTram)) + " trăm"
        if hangChuc == 0 && hangDonVi != 0{
            ret += " linh"
        }
    }
    if hangChuc != 0 && hangChuc != 1{
        ret += " " + convertDictNumber(num: String(hangChuc)) + " mươi"
        if hangChuc == 0 && hangDonVi != 0{
            ret += " linh"
        }
    }
    if hangChuc == 1 {
        ret += " mười"
    }
    switch hangDonVi {
    case 1:
        if hangChuc != 0 && hangChuc != 1{
            ret += " mốt"
        }else{
            ret += " \(convertDictNumber(num: String(hangDonVi)))"
        }
    case 5:
        if hangChuc == 0{
            ret += " \(convertDictNumber(num: String(hangDonVi)))"
        }else{
            ret += " lăm"
        }
    default:
        if hangDonVi != 0{
            ret += " \(convertDictNumber(num: String(hangDonVi)))"
        }
    }
    return ret
}
func docSoTienThanhChu(num: Int)-> String{
    var ret: String = ""
    var temp = ""
    var arrHang = splitedNumberString(str: String(num), length: 3)
    var n = arrHang.count
    while n > 0 {
        n -= 1
        temp = docBaSo(num: Int(arrHang[n])!)
        ret += temp
        if Int(arrHang[n]) != 0{
            ret += hangTien[n]
        }
        
        //        if n > 0 && temp != "" {
        //            ret += " ,"
        //        }
    }
    var arr = ret.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: "  ")
    if arr.count > 1{
        var tmp = ""
        arr.forEach({
            tmp += " \($0)"
        })
        return tmp
    }else{
        return "\(arr[0])"
    }
}
func removeFormatAmount(string:String) -> NSNumber{
    let formatter = NumberFormatter()
    // specify a locale where the decimalSeparator is a comma
    //formatter.locale = NSLocale(localeIdentifier: "pt_BR")
    formatter.numberStyle = .decimal
    //formatter.currencySymbol = "$"
    formatter.decimalSeparator = ","
    return formatter.number(from: string) ?? 0
}
func formatCurrency(number: NSNumber)->String{
    let strFormatter = NumberFormatter()
    strFormatter.numberStyle = .decimal
    strFormatter.groupingSeparator = ","
    strFormatter.maximumFractionDigits = 2
    return strFormatter.string(from: number)!
}
let so = formatCurrency(number: 269909789158081033)
var soTien = "-12,269,909,789,158,081,033.0"
var res = ""
var t = 0
if (soTien.characters.count) > 26{
    res = "Không Thể Đọc Số \(soTien) Thành Chữ\r\nSystem Errors"
}else{

let firstIndexChar = splitedNumberString(str: soTien, length: 1)
if (firstIndexChar[soTien.characters.count-1]).contains("-"){
    let arrSo = soTien.components(separatedBy: "-")
    let dec = arrSo[1].components(separatedBy: ".")
    let phannguyen = docSoTienThanhChu(num: Int(removeFormatAmount(string: dec[0])))
    if Int(dec[1])! > 0{
        let phanle = docSoTienThanhChu(num: Int(dec[1])!)
         res = "ÂM\(phannguyen.uppercased()) VÀ \(phanle.uppercased())"
    }else{
     res = "ÂM\(phannguyen.uppercased())"
    }

}else{
    let dec = soTien.components(separatedBy: ".")
    removeFormatAmount(string: dec[0])
    let phannguyen = docSoTienThanhChu(num: Int(removeFormatAmount(string: dec[0])))
    if Int(dec[1])! > 0{
        let phanle = docSoTienThanhChu(num: Int(dec[1])!)
        res = "\(phannguyen.uppercased()) VÀ \(phanle.uppercased())"
    }else{
        res = "\(phannguyen.uppercased())"
    }
    
    
}
}
print(res)
