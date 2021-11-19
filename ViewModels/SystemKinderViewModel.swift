//
//  SystemKinderViewModel.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/11/01.
//

import Foundation
import RxSwift
import RxCocoa
import RxRelay

class SystemKinderViewModel{
    lazy var code = BehaviorRelay<String>(value: "")
    lazy var cityId = BehaviorRelay<Int>(value: 0)
    
    // MARK: - System
    lazy var currentSystem = APIManager.shared.getSystem(self.cityId.value, self.code.value)
    
    // MARK: - Class
    lazy var currentClass = APIManager.shared.getClass(self.cityId.value, self.code.value)
 
}
