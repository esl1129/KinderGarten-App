//
//  InspectViewModel.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/11/02.
//

import Foundation
import RxSwift
import RxCocoa
import RxRelay

class InspectKinderVIewModel{
    lazy var code = BehaviorRelay<String>(value: "")
    lazy var cityId = BehaviorRelay<Int>(value: 0)
    
    // MARK: - Inspect
    lazy var currentInspect = APIManager.shared.getInspect(self.cityId.value, self.code.value)

}
