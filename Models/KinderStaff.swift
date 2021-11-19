//
//  KinderTeacher.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/11/02.
//
//
//  KinderStaffYear.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/11/02.
//

import Foundation

struct KinderStaffArr: Codable{
    var status: String
    var kinderInfo: [KinderStaff]
    
    enum CodingKeys: String, CodingKey{
        case status
        case kinderInfo = "kinderInfo"
    }
}

struct KinderStaff: Codable{
    let code: String
    let name: String
    let ledger: String
    let director: String
    let head: String
    let pos: String
    let general: String
    let special: String
    let health: String
    let nutrition: String
    let fixTerm: String
    let office: String
    
    let headQa: String
    let orthodox1: String
    let orthodox2: String
    let associate: String
    
    enum CodingKeys: String,CodingKey {
        case code = "kindercode"
        case name = "kindername"
        case ledger = "drcnt"
        case director = "adcnt"
        case head = "hdst_thcnt"
        case pos = "asps_thcnt"
        case general = "gnrl_thcnt"
        case special = "spcn_thcnt"
        case health = "ntcnt"
        case nutrition = "ntrt_thcnt"
        case fixTerm = "shcnt_thcnt"
        case office = "owcnt"
        case headQa = "hdst_tchr_qacnt"
        case orthodox1 = "rgth_gd1_qacnt"
        case orthodox2 = "rgth_gd2_qacnt"
        case associate = "asth_qacnt"
        
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(String.self, forKey: .code) ?? "-"
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? "-"
        ledger = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .ledger) ?? "-","명")
        director = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .director) ?? "-","명")
        head = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .head) ?? "-","명")
        pos = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .pos) ?? "-","명")
        general = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .general) ?? "-","명")
        special = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .special) ?? "-","명")
        health = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .health) ?? "-","명")
        nutrition = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .nutrition) ?? "-","명")
        fixTerm = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .fixTerm) ?? "-","명")
        office = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .office) ?? "-","명")
        headQa = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .headQa) ?? "-","명")
        orthodox1 = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .orthodox1) ?? "-","명")
        orthodox2 = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .orthodox2) ?? "-","명")
        associate = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .associate) ?? "-","명")
    }
}
