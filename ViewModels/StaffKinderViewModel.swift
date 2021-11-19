//
//  TeacherKinderViewModel.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/11/02.
//

import Foundation
import RxSwift
import RxCocoa
import RxRelay
import CloudKit

class StaffKinderViewModel{
    lazy var code = BehaviorRelay<String>(value: "")
    lazy var cityId = BehaviorRelay<Int>(value: 0)

    lazy var currentStaff = APIManager.shared.getStaff(self.cityId.value, self.code.value)
    
    // MARK: - Teacher Year
    lazy var currentStaffYear = APIManager.shared.getStaffYear(self.cityId.value, self.code.value)
}
