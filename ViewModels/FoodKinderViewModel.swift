//
//  FoodKinderViewModel.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/11/02.
//

import Foundation
import RxSwift
import RxCocoa
import RxRelay

class FoodKinderViewModel{
    lazy var code = BehaviorRelay<String>(value: "")
    lazy var cityId = BehaviorRelay<Int>(value: 0)
    
    // MARK: - Food
    lazy var currentFood = APIManager.shared.getFood(self.cityId.value, self.code.value)
    
    // MARK: - Bus
    lazy var currentBus = APIManager.shared.getBus(self.cityId.value, self.code.value)
}
