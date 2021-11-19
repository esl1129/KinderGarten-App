//
//  KinderStaffYear.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/11/02.
//

import Foundation

struct KinderStaffYearArr: Codable{
    var status: String
    var kinderInfo: [KinderStaffYear]
    
    enum CodingKeys: String, CodingKey{
        case status
        case kinderInfo = "kinderInfo"
    }
}
struct KinderStaffYear: Codable{
    let code: String
    let name: String
    let _0to1: String
    let _1to2: String
    let _2to4: String
    let _4to6: String
    let _over6: String
    
    enum CodingKeys: String,CodingKey {
        case code = "kindercode"
        case name = "kindername"
        case _0to1 = "yy1_undr_thcnt"
        case _1to2 = "yy1_abv_yy2_undr_thcnt"
        case _2to4 = "yy2_abv_yy4_undr_thcnt"
        case _4to6 = "yy4_abv_yy6_undr_thcnt"
        case _over6 = "yy6_abv_thcnt"

    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(String.self, forKey: .code) ?? "-"
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? "-"
        _0to1 = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: ._0to1) ?? "-","명")
        _1to2 = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: ._1to2) ?? "-","명")
        _2to4 = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: ._2to4) ?? "-","명")
        _4to6 = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: ._4to6) ?? "-","명")
        _over6 = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: ._over6) ?? "-","명")
    }
}

