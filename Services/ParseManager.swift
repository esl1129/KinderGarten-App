//
//  ParseManager.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/11/01.
//

import Foundation
import RxSwift
import RxCocoa

final class ParseManager{
    static let shared = ParseManager()
}

// MARK: - Parse Format
extension ParseManager{
    func formatDate(_ str: String) -> String{
        if str == "-" { return str }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let convertDate = dateFormatter.date(from: str)
        
        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "yyyy년 M월 d일"
        let convertStr = myDateFormatter.string(from: convertDate!)
        return convertStr
    }
    func formatDay(_ str: String) -> String{
        return str == "-" ? "-" : "\(str)일"
    }
    func formatCnt(_ str: String,_ suf: String) -> String{
        return str.first! == "0" ? "-" : str.first! == "-" ? "-" : str+suf
    }
    func formatYN(_ str: String) -> String{
        return str == "Y" ? "O" : "X"
    }
    func formatArea(_ str: String) -> String{
        if str.count == 1 || str.first! == "0"{
            return "없음"
        }
        return str
    }
}

// MARK: - Load City
extension ParseManager{
    public func getSido(_ a : String) -> Observable<[String]> {
        var sidos = [String]()
        sidos.append("-")
        data.sorted{$0.key < $1.key}.forEach{
            sidos.append($0.key)
        }
        NSLog("Success : getSidoName")
        return Observable.just(sidos)
    }
    
    public func getCity(_ name: String) -> Observable<[String]>{
        guard let items = data[name] else {
            NSLog("Failed : getCityName : - \(name)")
            return Observable.just([])
        }
        var citys = [String]()
        citys.append("-")
        items.sorted{$0.key < $1.key}.forEach{
            citys.append($0.key)
        }
        NSLog("Success : getCityName : - \(name)")
        
        return Observable.just(citys)
    }
    
    public func getCityIdByName(_ sidoName: String, _ cityName: String) -> Int{
        NSLog("getCityIdByName : - \(sidoName),\(cityName)")
        guard let citys = data[sidoName], let id = citys[cityName] else{
            return 0
        }
        NSLog("Success : toGetCityId : - \(id)")
        return id
    }
}
