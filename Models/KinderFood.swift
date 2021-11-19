//
//  KinderFood.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/11/02.
//
import Foundation

struct KinderFoodArr: Codable{
    var status: String
    var kinderInfo: [KinderFood]
    
    enum CodingKeys: String, CodingKey{
        case status
        case kinderInfo = "kinderInfo"
    }
}

struct KinderFood: Codable{
    let code: String
    let name: String
    let kind: String
    let childCnt: String
    let privateNut: String
    let publicNut: String
    let chef: String
    let assistant: String
    let declaration: String
    
    enum CodingKeys: String,CodingKey {
        case code = "kindercode"
        case name = "kindername"
        case kind = "mlsr_oprn_way_tp_cd"
        case childCnt = "mlsr_kpcnt"
        case privateNut = "snge_agmt_ntrt_thcnt"
        case publicNut = "cprt_agmt_ntrt_thcnt"
        case chef = "ckcnt"
        case assistant = "cmcnt"
        case declaration = "mas_mspl_dclr_yn"

    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(String.self, forKey: .code) ?? "-"
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? "-"
        kind = try values.decodeIfPresent(String.self, forKey: .kind) ?? "-"
        childCnt = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .childCnt) ?? "-","명")
        privateNut = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .privateNut) ?? "-","명")
        publicNut = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .publicNut) ?? "-","명")
        chef = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .chef) ?? "-","명")
        assistant = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .assistant) ?? "-","명")
        declaration = ParseManager.shared.formatYN(try values.decodeIfPresent(String.self, forKey: .declaration) ?? "-")

    }
}
