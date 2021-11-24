import Foundation
import RxSwift
import RxCocoa
import Alamofire


let API_KEY = UserDefaults.standard.string(forKey: "API_KEY") ?? ""
final class APIManager{
    static let shared = APIManager()
}
extension Notification.Name {
    static let startSpin = Notification.Name("startSpin")
    static let stopSpin = Notification.Name("stopSpin")
}
// MARK: - Get Kinder List
extension APIManager{
    func getKinder(_ id: Int) -> Observable<[Kinder]> {
        NotificationCenter.default.post(name: .startSpin, object: nil)
        return Observable.create { observer -> Disposable in
            let url = "https://e-childschoolinfo.moe.go.kr/api/notice/basicInfo.do?key=\(API_KEY)&sidoCode=\(id/1000)&sggCode=\(id)"
            AF.request(url)
                .validate(statusCode: 200..<500)
                .responseJSON{ response in
                    switch response.result {
                    case .success(let object):
                        do{
                            let dataJSON = try JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
                            let getInstanceData = try? JSONDecoder().decode(KinderArr.self, from: dataJSON)
                            NotificationCenter.default.post(name: .stopSpin, object: nil)
                            observer.onNext(getInstanceData!.kinderInfo)
                            observer.onCompleted()
                        }catch{
                        }
                    case .failure(let err):
                        NotificationCenter.default.post(name: .stopSpin, object: nil)
                        observer.onError(err)
                    }
                }
            return Disposables.create()
        }
    }
}

// MARK: - Get Kinder System
extension APIManager{
    func getSystem(_ id: Int, _ code: String) -> Observable<KinderSystem> {
        return Observable.create { observer -> Disposable in
            let url = "https://e-childschoolinfo.moe.go.kr/api/notice/building.do?key=\(API_KEY)&sidoCode=\(id/1000)&sggCode=\(id)"
            AF.request(url)
                .validate(statusCode: 200..<500)
                .responseJSON{ response in
                    switch response.result {
                    case .success(let object):
                        do{
                            let dataJSON = try JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
                            let getInstanceData = try? JSONDecoder().decode(KinderSystemArr.self, from: dataJSON)
                            let currentSystem = (getInstanceData?.kinderInfo.filter{$0.code == code}.first)!
                            observer.onNext(currentSystem)
                            observer.onCompleted()
                        }catch{
                        }
                    case .failure(let err):
                        observer.onError(err)
                    }
                }
            return Disposables.create()
        }
    }
    
}


// MARK: - Get Kinder Class
extension APIManager{
    func getClass(_ id: Int, _ code: String) -> Observable<KinderClass> {
        return Observable.create { observer -> Disposable in
            let url = "https://e-childschoolinfo.moe.go.kr/api/notice/classArea.do?key=\(API_KEY)&sidoCode=\(id/1000)&sggCode=\(id)"
            AF.request(url)
                .validate(statusCode: 200..<500)
                .responseJSON{ response in
                    switch response.result {
                    case .success(let object):
                        do{
                            let dataJSON = try JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
                            let getInstanceData = try? JSONDecoder().decode(KinderClassArr.self, from: dataJSON)
                            let currentClass = (getInstanceData?.kinderInfo.filter{$0.code == code}.first)!
                            observer.onNext(currentClass)
                            observer.onCompleted()
                        }catch{
                        }
                    case .failure(let err):
                        observer.onError(err)
                    }
                }
            return Disposables.create()
        }
    }
}

// MARK: - Get Kinder Staff
extension APIManager{
    func getStaff(_ id: Int, _ code: String) -> Observable<KinderStaff> {
        return Observable.create { observer -> Disposable in
            let url = "https://e-childschoolinfo.moe.go.kr/api/notice/teachersInfo.do?key=\(API_KEY)&sidoCode=\(id/1000)&sggCode=\(id)"
            AF.request(url)
                .validate(statusCode: 200..<500)
                .responseJSON{ response in
                    switch response.result {
                    case .success(let object):
                        do{
                            let dataJSON = try JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
                            let getInstanceData = try? JSONDecoder().decode(KinderStaffArr.self, from: dataJSON)
                            let currentStaff = (getInstanceData?.kinderInfo.filter{$0.code == code}.first)!
                            observer.onNext(currentStaff)
                            observer.onCompleted()
                        }catch{
                        }
                    case .failure(let err):
                        observer.onError(err)
                    }
                }
            return Disposables.create()
        }
    }
}

// MARK: - Get Kinder Staff Year
extension APIManager{
    func getStaffYear(_ id: Int, _ code: String) -> Observable<KinderStaffYear> {
        return Observable.create { observer -> Disposable in
            let url = "https://e-childschoolinfo.moe.go.kr/api/notice/yearOfWork.do?key=\(API_KEY)&sidoCode=\(id/1000)&sggCode=\(id)"
            
            AF.request(url)
                .validate(statusCode: 200..<500)
                .responseJSON{ response in
                    switch response.result {
                    case .success(let object):
                        do{
                            let dataJSON = try JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
                            let getInstanceData = try? JSONDecoder().decode(KinderStaffYearArr.self, from: dataJSON)
                            let currentStaffYear = (getInstanceData?.kinderInfo.filter{$0.code == code}.first)!
                            observer.onNext(currentStaffYear)
                            observer.onCompleted()
                        }catch{
                        }
                    case .failure(let err):
                        observer.onError(err)
                    }
                }
            return Disposables.create()
        }
    }
}

// MARK: - Get Kinder Food
extension APIManager{
    func getFood(_ id: Int, _ code: String) -> Observable<KinderFood> {
        return Observable.create { observer -> Disposable in
            let url = "https://e-childschoolinfo.moe.go.kr/api/notice/schoolMeal.do?key=\(API_KEY)&sidoCode=\(id/1000)&sggCode=\(id)"
            
            AF.request(url)
                .validate(statusCode: 200..<500)
                .responseJSON{ response in
                    switch response.result {
                    case .success(let object):
                        do{
                            let dataJSON = try JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
                            let getInstanceData = try? JSONDecoder().decode(KinderFoodArr.self, from: dataJSON)
                            let currentFood = (getInstanceData?.kinderInfo.filter{$0.code == code}.first)!
                            observer.onNext(currentFood)
                            observer.onCompleted()
                        }catch{
                        }
                    case .failure(let err):
                        observer.onError(err)
                    }
                }
            return Disposables.create()
        }
    }
}
// MARK: - Get Kinder Bus
extension APIManager{
    func getBus(_ id: Int, _ code: String) -> Observable<KinderBus> {
        return Observable.create { observer -> Disposable in
            let url = "https://e-childschoolinfo.moe.go.kr/api/notice/schoolBus.do?key=\(API_KEY)&sidoCode=\(id/1000)&sggCode=\(id)"
            
            AF.request(url)
                .validate(statusCode: 200..<500)
                .responseJSON{ response in
                    switch response.result {
                    case .success(let object):
                        do{
                            let dataJSON = try JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
                            let getInstanceData = try? JSONDecoder().decode(KinderBusArr.self, from: dataJSON)
                            let currentBus = (getInstanceData?.kinderInfo.filter{$0.code == code}.first)!
                            observer.onNext(currentBus)
                            observer.onCompleted()
                        }catch{
                        }
                    case .failure(let err):
                        observer.onError(err)
                    }
                }
            return Disposables.create()
        }
    }
}
// MARK: - Get Kinder Inspect
extension APIManager{
    func getInspect(_ id: Int, _ code: String) -> Observable<KinderInspect> {
        return Observable.create { observer -> Disposable in
            let url = "https://e-childschoolinfo.moe.go.kr/api/notice/safetyEdu.do?key=\(API_KEY)&sidoCode=\(id/1000)&sggCode=\(id)"
            
            AF.request(url)
                .validate(statusCode: 200..<500)
                .responseJSON{ response in
                    switch response.result {
                    case .success(let object):
                        do{
                            let dataJSON = try JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
                            let getInstanceData = try? JSONDecoder().decode(KinderInspectArr.self, from: dataJSON)
                            let currentInspect = (getInstanceData?.kinderInfo.filter{$0.code == code}.first)!
                            observer.onNext(currentInspect)
                            observer.onCompleted()
                        }catch{
                        }
                    case .failure(let err):
                        observer.onError(err)
                    }
                }
            return Disposables.create()
        }
    }
}
// MARK: - Get Kinder Hygiene
extension APIManager{
    func getHygiene(_ id: Int, _ code: String) -> Observable<KinderHygiene> {
        return Observable.create { observer -> Disposable in
            let url = "https://e-childschoolinfo.moe.go.kr/api/notice/environmentHygiene.do?key=\(API_KEY)&sidoCode=\(id/1000)&sggCode=\(id)"
            AF.request(url)
                .validate(statusCode: 200..<500)
                .responseJSON{ response in
                    switch response.result {
                    case .success(let object):
                        do{
                            let dataJSON = try JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
                            let getInstanceData = try? JSONDecoder().decode(KinderHygieneArr.self, from: dataJSON)
                            let currentHygiene = (getInstanceData?.kinderInfo.filter{$0.code == code}.first)!
                            observer.onNext(currentHygiene)
                            observer.onCompleted()
                        }catch{
                        }
                    case .failure(let err):
                        observer.onError(err)
                    }
                }
            return Disposables.create()
        }
    }
}
// MARK: - Get Kinder Date
extension APIManager{
    func getLesson(_ id: Int, _ code: String) -> Observable<KinderLesson> {
        return Observable.create { observer -> Disposable in
            let url = "https://e-childschoolinfo.moe.go.kr/api/notice/lessonDay.do?key=\(API_KEY)&sidoCode=\(id/1000)&sggCode=\(id)"
            AF.request(url)
                .validate(statusCode: 200..<500)
                .responseJSON{ response in
                    switch response.result {
                    case .success(let object):
                        do{
                            let dataJSON = try JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
                            let getInstanceData = try? JSONDecoder().decode(KinderLessonArr.self, from: dataJSON)
                            let currentLesson = (getInstanceData?.kinderInfo.filter{$0.code == code}.first)!
                            observer.onNext(currentLesson)
                            observer.onCompleted()
                        }catch{
                        }
                    case .failure(let err):
                        observer.onError(err)
                    }
                }
            return Disposables.create()
        }
    }
}
// MARK: - Get Kinder Society
extension APIManager{
    func getSociety(_ id: Int, _ code: String) -> Observable<KinderSociety> {
        return Observable.create { observer -> Disposable in
            let url = "https://e-childschoolinfo.moe.go.kr/api/notice/deductionSociety.do?key=\(API_KEY)&sidoCode=\(id/1000)&sggCode=\(id)"
            AF.request(url)
                .validate(statusCode: 200..<500)
                .responseJSON{ response in
                    switch response.result {
                    case .success(let object):
                        do{
                            let dataJSON = try JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
                            let getInstanceData = try? JSONDecoder().decode(KinderSocietyArr.self, from: dataJSON)
                            let currentSociety = (getInstanceData?.kinderInfo.filter{$0.code == code}.first)!
                            observer.onNext(currentSociety)
                            observer.onCompleted()
                        }catch{
                        }
                    case .failure(let err):
                        observer.onError(err)
                    }
                }
            return Disposables.create()
        }
    }
}
// MARK: - Get Kinder Insurance
extension APIManager{
    func getInsurance(_ id: Int, _ code: String) -> Observable<KinderInsurance> {
        return Observable.create { observer -> Disposable in
            let url = "https://e-childschoolinfo.moe.go.kr/api/notice/insurance.do?key=\(API_KEY)&sidoCode=\(id/1000)&sggCode=\(id)"
            AF.request(url)
                .validate(statusCode: 200..<500)
                .responseJSON{ response in
                    switch response.result {
                    case .success(let object):
                        do{
                            let dataJSON = try JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
                            let getInstanceData = try? JSONDecoder().decode(KinderInsuranceArr.self, from: dataJSON)
                            let currentInsurance = (getInstanceData?.kinderInfo.filter{$0.code == code}.first)!
                            observer.onNext(currentInsurance)
                            observer.onCompleted()
                        }catch{
                        }
                    case .failure(let err):
                        observer.onError(err)
                    }
                }
            return Disposables.create()
        }
    }
}
