//
//  KinderDate.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/11/04.
//

import Foundation

struct KinderLessonArr: Codable{
    var status: String
    var kinderInfo: [KinderLesson]
    
    enum CodingKeys: String, CodingKey{
        case status
        case kinderInfo = "kinderInfo"
    }
}

struct KinderLesson: Codable{
    let code: String
    let name: String
    let rdDt: String
    let foDt: String
    let fiDt: String
    let mixDt: String
    let scDt: String
    let afDt: String

    enum CodingKeys: String,CodingKey {
        case code = "kindercode"
        case name = "kindername"
        case rdDt = "ag3_lsn_dcnt"
        case foDt = "ag4_lsn_dcnt"
        case fiDt = "ag5_lsn_dcnt"
        case mixDt = "mix_age_lsn_dcnt"
        case scDt = "spcl_lsn_dcnt"
        case afDt = "afsc_pros_lsn_dcnt"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(String.self, forKey: .code) ?? "-"
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? "-"
        rdDt = ParseManager.shared.formatDay(try values.decodeIfPresent(String.self, forKey: .rdDt) ?? "-")
        foDt = ParseManager.shared.formatDay(try values.decodeIfPresent(String.self, forKey: .foDt) ?? "-")
        fiDt = ParseManager.shared.formatDay(try values.decodeIfPresent(String.self, forKey: .fiDt) ?? "-")
        mixDt = ParseManager.shared.formatDay(try values.decodeIfPresent(String.self, forKey: .mixDt) ?? "-")
        scDt = ParseManager.shared.formatDay(try values.decodeIfPresent(String.self, forKey: .scDt) ?? "-")
        afDt = ParseManager.shared.formatDay(try values.decodeIfPresent(String.self, forKey: .afDt) ?? "-")


    }
}
