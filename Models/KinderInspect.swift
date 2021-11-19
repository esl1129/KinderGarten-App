//
//  Inspect.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/11/02.
//

import Foundation
struct KinderInspectArr: Codable{
    var status: String
    var kinderInfo: [KinderInspect]
    
    enum CodingKeys: String, CodingKey{
        case status
        case kinderInfo = "kinderInfo"
    }
}

struct KinderInspect: Codable{
    let code: String
    let name: String
    let fire_chk: String
    let fire_dt: String
    let gas_chk: String
    let gas_dt: String
    let fire_safe_chk: String
    let fire_safe_dt: String
    let elec_chk: String
    let elec_dt: String
    let plyg_chk: String
    let plyg_dt: String
    let plyg_rs: String
    let cctv_chk: String
    let cctv_total_cnt: String
    let cctv_in_cnt: String
    let cctv_out_cnt: String
    
    enum CodingKeys: String,CodingKey {
        case code = "kindercode"
        case name = "kindername"
        case fire_chk = "fire_avd_yn"
        case fire_dt = "fire_avd_dt"
        case gas_chk = "gas_ck_yn"
        case gas_dt = "gas_ck_dt"
        case fire_safe_chk = "fire_safe_yn"
        case fire_safe_dt = "fire_safe_dt"
        case elec_chk = "elect_ck_yn"
        case elec_dt = "elect_ck_dt"
        case plyg_chk = "plyg_ck_yn"
        case plyg_dt = "plyg_ck_dt"
        case plyg_rs = "plyg_ck_rs_cd"
        case cctv_chk = "cctv_ist_yn"
        case cctv_total_cnt = "cctv_ist_total"
        case cctv_in_cnt = "cctv_ist_in"
        case cctv_out_cnt = "cctv_ist_out"

    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(String.self, forKey: .code) ?? "-"
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? "-"
        fire_chk = ParseManager.shared.formatYN(try values.decodeIfPresent(String.self, forKey: .fire_chk) ?? "-")
        fire_dt = ParseManager.shared.formatDate(try values.decodeIfPresent(String.self, forKey: .fire_dt) ?? "-")
        gas_chk = ParseManager.shared.formatYN(try values.decodeIfPresent(String.self, forKey: .gas_chk) ?? "-")
        gas_dt = ParseManager.shared.formatDate(try values.decodeIfPresent(String.self, forKey: .gas_dt) ?? "-")
        fire_safe_chk = ParseManager.shared.formatYN(try values.decodeIfPresent(String.self, forKey: .fire_safe_chk) ?? "-")
        fire_safe_dt = ParseManager.shared.formatDate(try values.decodeIfPresent(String.self, forKey: .fire_safe_dt) ?? "-")
        elec_chk = ParseManager.shared.formatYN(try values.decodeIfPresent(String.self, forKey: .elec_chk) ?? "-")
        elec_dt = ParseManager.shared.formatDate(try values.decodeIfPresent(String.self, forKey: .elec_dt) ?? "-")
        plyg_chk = ParseManager.shared.formatYN(try values.decodeIfPresent(String.self, forKey: .plyg_chk) ?? "-")
        plyg_dt = ParseManager.shared.formatDate(try values.decodeIfPresent(String.self, forKey: .plyg_dt) ?? "-")
        plyg_rs = try values.decodeIfPresent(String.self, forKey: .plyg_rs) ?? "-"
        cctv_chk = ParseManager.shared.formatYN(try values.decodeIfPresent(String.self, forKey: .cctv_chk) ?? "-")
        cctv_total_cnt = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .cctv_total_cnt) ?? "-","개")
        cctv_in_cnt = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .cctv_in_cnt) ?? "-","개")
        cctv_out_cnt = ParseManager.shared.formatCnt(try values.decodeIfPresent(String.self, forKey: .cctv_out_cnt) ?? "-","개")


    }
}
