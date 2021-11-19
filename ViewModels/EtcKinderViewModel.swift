//
//  etcViewModel.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/11/04.
//

import Foundation
import RxSwift
import RxCocoa
import RxRelay

class EtcKinderViewModel{
    lazy var code = BehaviorRelay<String>(value: "")
    lazy var cityId = BehaviorRelay<Int>(value: 0)
    
    // MARK: - Inspect
    lazy var currentLesson = APIManager.shared.getLesson(self.cityId.value, self.code.value)
    lazy var currentSociety = APIManager.shared.getSociety(self.cityId.value, self.code.value)
    lazy var currentInsurance = APIManager.shared.getInsurance(self.cityId.value, self.code.value)

}
