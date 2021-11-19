//
//  KinderInsurance.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/11/04.
//

import Foundation

struct KinderInsuranceArr: Codable{
    var status: String
    var kinderInfo: [KinderInsurance]
    
    enum CodingKeys: String, CodingKey{
        case status
        case kinderInfo = "kinderInfo"
    }
}

struct KinderInsurance: Codable{
    let code: String
    let name: String
    let insName: String
    let insChk: String
    let insEn: String
    let company: String

    enum CodingKeys: String,CodingKey {
        case code = "kindercode"
        case name = "kindername"
        case insName = "insurance_nm"
        case insChk = "insurance_en"
        case insEn = "insurance_yn"
        case company = "company1"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(String.self, forKey: .code) ?? "-"
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? "-"
        insName = try values.decodeIfPresent(String.self, forKey: .insName) ?? "-"
        insChk = ParseManager.shared.formatYN(try values.decodeIfPresent(String.self, forKey: .insChk) ?? "-")
        insEn = ParseManager.shared.formatYN(try values.decodeIfPresent(String.self, forKey: .insEn) ?? "-")
        company = try values.decodeIfPresent(String.self, forKey: .company) ?? "-"


    }
}
