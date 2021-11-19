//
//  KinderSociety.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/11/04.
//

import Foundation

struct KinderSocietyArr: Codable{
    var status: String
    var kinderInfo: [KinderSociety]
    
    enum CodingKeys: String, CodingKey{
        case status
        case kinderInfo = "kinderInfo"
    }
}

struct KinderSociety: Codable{
    let code: String
    let name: String
    let schChk: String
    let schEn: String
    let eduChk: String
    let eduEn: String

    enum CodingKeys: String,CodingKey {
        case code = "kindercode"
        case name = "kindername"
        case schChk = "school_ds_yn"
        case schEn = "school_ds_en"
        case eduChk = "educate_ds_yn"
        case eduEn = "ducate_ds_en"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(String.self, forKey: .code) ?? "-"
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? "-"
        schChk = ParseManager.shared.formatYN(try values.decodeIfPresent(String.self, forKey: .schChk) ?? "-")
        schEn = ParseManager.shared.formatYN(try values.decodeIfPresent(String.self, forKey: .schEn) ?? "-")
        eduChk = ParseManager.shared.formatYN(try values.decodeIfPresent(String.self, forKey: .eduChk) ?? "-")
        eduEn = ParseManager.shared.formatYN(try values.decodeIfPresent(String.self, forKey: .eduEn) ?? "-")


    }
}
