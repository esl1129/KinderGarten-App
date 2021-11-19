//
//  Sample.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/11/03.
//

import Foundation

struct SSample: Codable{
    let kinderInfo: String
    let data: [Sample]
    

}
struct Sample: Codable{
    let code: String
    let name: String
    let _0to1: String
    let _1to2: String
    let _2to4: String
    let _4to6: String
    let _over6: String
    
    init(){
        self.code = "Ex_1111"
        self.name = "Ex_Name"
        self._0to1 = "0"
        self._1to2 = "0"
        self._2to4 = "0"
        self._4to6 = "0"
        self._over6 = "0"
    }
    enum CodingKeys: String,CodingKey {
        case code = "kindercode"
        case name = "kindername"
        case _0to1 = "yy1_undr_thcnt"
        case _1to2 = "yy1_abv_yy2_undr_thcnt"
        case _2to4 = "yy2_abv_yy4_undr_thcnt"
        case _4to6 = "yy4_abv_yy6_undr_thcnt"
        case _over6 = "yy6_abv_thcnt"

    }
}
