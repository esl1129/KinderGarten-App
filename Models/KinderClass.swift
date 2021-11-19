//
//  KinderClass.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/11/02.
//

import Foundation
struct KinderClassArr: Codable{
    var status: String
    var kinderInfo: [KinderClass]
    
    enum CodingKeys: String, CodingKey{
        case status
        case kinderInfo = "kinderInfo"
    }
}
struct KinderClass: Codable{
    let code: String
    let name: String
    let clsCnt: String
    let clsArea: String
    let gymArea: String
    let healthArea: String
    let nutArea: String
    let etcArea: String
    
    enum CodingKeys: String,CodingKey {
        case code = "kindercode"
        case name = "kindername"
        case clsCnt = "crcnt"
        case clsArea = "clsrarea"
        case gymArea = "phgrindrarea"
        case healthArea = "hlsparea"
        case nutArea = "ktchmssparea"
        case etcArea = "otsparea"

    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(String.self, forKey: .code) ?? "-"
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? "-"
        clsCnt = ParseManager.shared.formatArea(try values.decodeIfPresent(String.self, forKey: .clsCnt) ?? "-")
        clsArea = ParseManager.shared.formatArea(try values.decodeIfPresent(String.self, forKey: .clsArea) ?? "-")
        gymArea = ParseManager.shared.formatArea(try values.decodeIfPresent(String.self, forKey: .gymArea) ?? "-")
        healthArea = ParseManager.shared.formatArea(try values.decodeIfPresent(String.self, forKey: .healthArea) ?? "-")
        nutArea = ParseManager.shared.formatArea(try values.decodeIfPresent(String.self, forKey: .nutArea) ?? "-")
        etcArea = ParseManager.shared.formatArea(try values.decodeIfPresent(String.self, forKey: .etcArea) ?? "-")

    }
}
