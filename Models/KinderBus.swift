//
//  KinderBus.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/11/02.
//
import Foundation

struct KinderBusArr: Codable{
    var status: String
    var kinderInfo: [KinderBus]
    
    enum CodingKeys: String, CodingKey{
        case status
        case kinderInfo = "kinderInfo"
    }
}

struct KinderBus: Codable{
    let code: String
    let name: String
    let chk: String
    let operation: String
    let declaration: String
    let psg9: String
    let psg12: String
    let psg15: String
    
    enum CodingKeys: String,CodingKey {
        case code = "kindercode"
        case name = "kindername"
        case chk = "vhcl_oprn_yn"
        case operation = "opra_vhcnt"
        case declaration = "dclr_vhcnt"
        case psg9 = "psg9_dclr_vhcnt"
        case psg12 = "psg12_dclr_vhcnt"
        case psg15 = "psg15_dclr_vhcnt"

    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(String.self, forKey: .code) ?? "-"
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? "-"
        chk = ParseManager.shared.formatYN(try values.decodeIfPresent(String.self, forKey: .chk) ?? "-")
        operation = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .operation) ?? "-","대")
        declaration = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .declaration) ?? "-","대")
        psg9 = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .psg9) ?? "-","대")
        psg12 = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .psg12) ?? "-","대")
        psg15 = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .psg15) ?? "-","대")

    }
}
