//
//  ExtensionFunction.swift
//  MyJsonMySQL
//
//  Created by Cam Loan on 11/29/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import Foundation
import UIKit

    // connect to url of json to retrieve or update information
    // use get method or post method
    // pass parameters with method
    // if existed images or not
    // with get method use dictionary with [key:value] for parameter after question mark correspondingly
class ExtensionFunction{
    func getJSONData(fromDomain domainString: String, Params params: Dictionary<String,Any>?, MethodHTTP method: String, completionHandler: @escaping (Any?)->()){
        
        // method - parameters
        var urlString: String = domainString
        if method.lowercased() == "get"{
            // parameter of get if existed
            if let param = params{
                urlString += "?\(param.convertParamsofDict2String())"
            }
        }
        let url: URL = URL(string: urlString)!
        var request: URLRequest = URLRequest(url: url)
        if method.lowercased() == "post"{
            request.httpMethod = "POST"
            let body = NSMutableData()
            // define multipart of request type
            let boundary = generateBoundaryString()
            request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            // define parameter of post method
            // if para is image, or not
            for param in params!{
                if let img:UIImage = param.value as? UIImage{
                    let dataPhoto = UIImageJPEGRepresentation(img, 0.5) // use jpeg format with compressed value
                    // create file name with datetime upload
                    let fileName: String = "\(getCurTime2Fiile()).jpg"
                    // and create mime-type
                    let mimeType = "image/jpg"
                    body.append("--\(boundary)\r\n".data(using: .utf8)!)
                    body.append("Content-Disposition: form-data; name=\"\(param.key)\"; FileName=\"\(fileName)\"\r\n".data(using: .utf8)!)
                    body.append("Content-Type: \(mimeType)\r\n\r\n".data(using: .utf8)!)
                    body.append(dataPhoto!)
                    body.append("\r\n".data(using: .utf8)!)
                }else{
                    // not using image
                    //print("\(param.key) \(param.value)")
                    body.append("--\(boundary)\r\n".data(using: .utf8)!)
                    body.append("Content-Disposition: form-data; name=\"\(param.key)\"\r\n\r\n".data(using: .utf8)!)
                    body.append("\(param.value)\r\n".data(using: .utf8)!)
                    body.append("--\(boundary)--\r\n".data(using: .utf8)!)
                    
                }
            }
            request.httpBody = body as Data
        }
        
        // session: get result
        
        let session: URLSession = URLSession.shared
        session.dataTask(with: request, completionHandler: {(data, res, err) in
            let responseStatusCode = (res as! HTTPURLResponse).statusCode
            if responseStatusCode == 200{
                do{
                    let result = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                    DispatchQueue.main.async {
                        completionHandler(result)
                        //print(result)
                    }
                }catch{
                    completionHandler(nil)
                }
            }else{
                DispatchQueue.main.async {
                    completionHandler(nil)
                }
                
            }
        }).resume()
    }
    
    func generateBoundaryString() -> String
    {
        return "Boundary-\(NSUUID().uuidString)"
    }
    func getCurTime2Fiile() -> String{
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        let nano = calendar.component(.nanosecond, from: date)
        return "\(hour)-\(minutes)-\(second)-\(nano)"
    }
    func getDate()->String{
        let date = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        return "\(day)/\(month)/\(year) \(hour):\(minutes)"
    }
}
extension Dictionary{
    func convertParamsofDict2String() -> String{
        var paraStr: String = ""
        for (key,value) in self.enumerated(){
            if key == 0{
                paraStr += "\(key)=\(value)"
            }else{
                paraStr += "&\(key)=\(value)"
            }
        }
        return paraStr
    }
}

