import Foundation
import RxSwift
import RxCocoa

class KinderViewModel{
    // MARK: - Picker
    lazy var def = BehaviorRelay<String>(value: "")
    lazy var doData: Driver<[String]> = {
        return self.def.asObservable()
            .throttle(.milliseconds(200), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .flatMapLatest(ParseManager.shared.getSido)
            .asDriver(onErrorJustReturn: [])
    }()

    lazy var doName = BehaviorRelay<String>(value: "")
    lazy var cityData: Driver<[String]> = {
        return self.doName.asObservable()
            .throttle(.milliseconds(200), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .flatMapLatest(ParseManager.shared.getCity)
            .asDriver(onErrorJustReturn: [])
    }()
    
    lazy var cityName = BehaviorRelay<String>(value: "")
    var cityId: Observable<Int> {
        return Observable.combineLatest(doName, cityName)
            .map{ sido, cityName in
                return ParseManager.shared.getCityIdByName(sido, cityName)
            }
    }
    
    // MARK: - Kinder
    lazy var kinderData: Driver<[Kinder]> = {
        return self.cityId.asObservable()
            .throttle(.milliseconds(200), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .flatMapLatest(APIManager.shared.getKinder)
            .asDriver(onErrorJustReturn: [])
    }()
    
}

