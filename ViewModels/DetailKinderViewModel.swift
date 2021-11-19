//
//  DetailKinderViewModel.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/10/28.
//

import Foundation
import RxSwift
import RxCocoa

class DetailKinderViewModel{
    // MARK: - Current Kinder for DetailViewController
    lazy var currentKinder = BehaviorRelay<Kinder>(value: Kinder())
    lazy var cityId = BehaviorRelay<Int>(value: 0)

}
