//
//  HygieneKinderViewModel.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/11/04.
//

import Foundation
import RxSwift
import RxCocoa
import RxRelay

class HygieneKinderViewModel{
    lazy var code = BehaviorRelay<String>(value: "")
    lazy var cityId = BehaviorRelay<Int>(value: 0)
    
    // MARK: - Inspect
    lazy var currentHygiene = APIManager.shared.getHygiene(self.cityId.value, self.code.value)

}
