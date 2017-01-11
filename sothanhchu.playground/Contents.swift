//: Playground - noun: a place where people can play

import UIKit


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
//splitedNumberString(str: "12035750", length: 3).forEach({print($0)})
var arrHang = splitedNumberString(str: "1535110005557", length: 3)
var dictSo = ["0":"khong","1":"mot","2":"hai","3":"ba","4":"bon","5":"nam","6":"sau","7":"bay","8":"tam","9":"chin"]
func convertDictNumber(num: String)->String{
    var str = ""
    dictSo.forEach({
        if $0.key.contains(num){
            str = $0.value
        }
    })
    return str
}
func convertNum2Str(num: String, nhom: String)->String{
    var str = ""
    var arr =  splitedNumberString(str: num, length: 1)
    if nhom.lowercased() == "donvi"{
        if arr.count >= 3 {
            if arr[0] == "0"{
                str = "\(convertDictNumber(num: arr[2])) tram \(convertDictNumber(num: arr[1])) muoi"
            }else{
                str = "\(convertDictNumber(num: arr[2])) tram \(convertDictNumber(num: arr[1])) muoi \(convertDictNumber(num: arr[0]))"
            }
        }else if arr.count >= 2 && arr.count < 3{
            if arr[0] == "0"{
                str = "\(convertDictNumber(num: arr[1])) chuc"
            }else{
                str = "\(convertDictNumber(num: arr[1])) muoi \(convertDictNumber(num: arr[0]))"
            }
        }else{
            str = "\(convertDictNumber(num: arr[0]))"
        }
    }else if nhom.lowercased() == "nghin"{
        if arr.count >= 3 {
            if arr[1] == "0" && arr[0] != "0"{
                str = "\(convertDictNumber(num: arr[2])) tram le \(convertDictNumber(num: arr[0])) nghin"
            }else if arr[1] == "0" && arr[0] == "0"{
                str = "\(convertDictNumber(num: arr[2])) tram nghin"
            }else if arr[1] != "0" && arr[0] == "0"{
                str = "\(convertDictNumber(num: arr[2])) tram \(convertDictNumber(num: arr[1])) muoi nghin"
            }
            else{
                str = "\(convertDictNumber(num: arr[2])) tram \(convertDictNumber(num: arr[1])) muoi \(convertDictNumber(num: arr[0])) nghin"
            }
        }
    }else if nhom.lowercased() == "trieu"{
        if arr.count >= 3 {
            if arr[1] == "0" && arr[0] == "0"{
                str = "\(convertDictNumber(num: arr[2])) tram trieu"
            }else if arr[1] == "0" && arr[0] >= "1"{
                str = "\(convertDictNumber(num: arr[2])) tram le \(convertDictNumber(num: arr[0])) trieu"
            }else if arr[1] == "1" && arr[0] == "0"{
                str = "\(convertDictNumber(num: arr[2])) tram muoi trieu"
            }else if arr[1] == "1" && arr[0] >= "1"{
                str = "\(convertDictNumber(num: arr[2])) tram muoi \(convertDictNumber(num: arr[0])) trieu"
            }else if arr[1] > "1" && arr[0] == "0"{
                str = "\(convertDictNumber(num: arr[2])) tram \(convertDictNumber(num: arr[1])) muoi trieu"
            }else{
                str = "\(convertDictNumber(num: arr[2])) tram \(convertDictNumber(num: arr[1])) muoi \(convertDictNumber(num: arr[0])) trieu"
            }
            
        }else if arr.count >= 2 && arr.count < 3{
            if arr[1] == "1" && arr[0] == "0"{
                str = "muoi trieu"
            }else if arr[1] == "1" && arr[0] >= "1"{
                str = "muoi \(convertDictNumber(num: arr[0])) trieu"
            }else if arr[1] >= "2" && arr[0] == "0"{
                str = "\(convertDictNumber(num: arr[1])) muoi trieu"
            }else{
                str = "\(convertDictNumber(num: arr[1])) muoi \(convertDictNumber(num: arr[0])) trieu"
            }
        }else if arr.count == 1{
            str = "\(convertDictNumber(num: arr[0])) trieu"
        }
    }else if nhom.lowercased() == "ty"{
        if arr.count == 1{
            str = "\(convertDictNumber(num: arr[0])) ty"
        }else if arr.count == 2{
            if arr[1] == "1" && arr[0] == "0"{
                str = "muoi ty"
            }else if arr[1] == "1" && arr[0] >= "1"{
                str = "muoi \(convertDictNumber(num: arr[0])) ty"
            }else if arr[1] >= "2" && arr[0] == "0"{
                str = "\(convertDictNumber(num: arr[1])) muoi ty"
            }else{
                str = "\(convertDictNumber(num: arr[1])) muoi \(convertDictNumber(num: arr[0])) ty"
            }
        }else if arr.count == 3{
            if arr[1] == "0" && arr[0] == "0"{
                str = "\(convertDictNumber(num: arr[2])) tram ty"
            }else if arr[1] == "0" && arr[0] >= "1"{
                str = "\(convertDictNumber(num: arr[2])) tram le \(convertDictNumber(num: arr[0])) ty"
            }else if arr[1] == "1" && arr[0] == "0"{
                str = "\(convertDictNumber(num: arr[2])) tram muoi ty"
            }else if arr[1] == "1" && arr[0] >= "1"{
                str = "\(convertDictNumber(num: arr[2])) tram muoi \(convertDictNumber(num: arr[0])) ty"
            }else if arr[1] > "1" && arr[0] == "0"{
                str = "\(convertDictNumber(num: arr[2])) tram \(convertDictNumber(num: arr[1])) muoi ty"
            }else{
                str = "\(convertDictNumber(num: arr[2])) tram \(convertDictNumber(num: arr[1])) muoi \(convertDictNumber(num: arr[0])) ty"
            }
        }
    }
    return str
    
}
func formatCurrency(number: NSNumber)->String{
    let strFormatter = NumberFormatter()
    strFormatter.groupingSeparator = ","
    strFormatter.maximumFractionDigits = 2
    strFormatter.numberStyle = .decimal
    return strFormatter.string(from: number)!
}

let strDonVi = convertNum2Str(num: arrHang[0], nhom: "donvi")
let strNghin = convertNum2Str(num: arrHang[1], nhom: "nghin")
let strTrieu = convertNum2Str(num: arrHang[2], nhom: "trieu")
let strTy = convertNum2Str(num: arrHang[3], nhom: "ty")

let strSo = "\(strTy) \(strTrieu) \(strNghin) \(strDonVi) dong"
print(strSo)