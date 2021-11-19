//
//  KinderHygiene.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/11/04.
//

import Foundation


struct KinderHygieneArr: Codable{
    var status: String
    var kinderInfo: [KinderHygiene]
    
    enum CodingKeys: String, CodingKey{
        case status
        case kinderInfo = "kinderInfo"
    }
}

struct KinderHygiene: Codable{
    let code: String
    let name: String
    let air_dt: String
    let air_rs: String
    let dinf_chk: String
    let dinf_dt: String
    let dinf_rs: String
    let mdst_dt: String
    let illu_dt: String

    enum CodingKeys: String,CodingKey {
        case code = "kindercode"
        case name = "kindername"
        case air_dt = "arql_chk_dt"
        case air_rs = "arql_chk_rslt_tp_cd"
        case dinf_chk = "fxtm_dsnf_trgt_yn"
        case dinf_dt = "fxtm_dsnf_chk_dt"
        case dinf_rs = "fxtm_dsnf_chk_rslt_tp_cd"
        case mdst_dt = "mdst_chk_dt"
        case illu_dt = "ilmn_chk_dt"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(String.self, forKey: .code) ?? "-"
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? "-"
        air_dt = ParseManager.shared.formatDate(try values.decodeIfPresent(String.self, forKey: .air_dt) ?? "-")
        air_rs = try values.decodeIfPresent(String.self, forKey: .air_rs) ?? "-"
        dinf_chk = ParseManager.shared.formatYN(try values.decodeIfPresent(String.self, forKey: .dinf_chk) ?? "-")
        dinf_dt = ParseManager.shared.formatDate(try values.decodeIfPresent(String.self, forKey: .dinf_dt) ?? "-")
        dinf_rs = try values.decodeIfPresent(String.self, forKey: .dinf_rs) ?? "-"

        mdst_dt = ParseManager.shared.formatDate(try values.decodeIfPresent(String.self, forKey: .mdst_dt) ?? "-")
        illu_dt = ParseManager.shared.formatDate(try values.decodeIfPresent(String.self, forKey: .illu_dt) ?? "-")


    }
}
