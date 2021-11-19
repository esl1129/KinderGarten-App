//
//  DetailTableViewController.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/10/29.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

class DetailTableViewController: UITableViewController {
    @IBOutlet weak var officeLabel: UILabel!
    @IBOutlet weak var subOfficeLabel: UILabel!
    @IBOutlet weak var kindLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var headTeacherLabel: UILabel!
    @IBOutlet weak var establishLabel: UILabel!
    @IBOutlet weak var openDateLabel: UILabel!
    @IBOutlet weak var operTimeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    let detailKinderViewModel = DetailKinderViewModel()
    let disposeBag = DisposeBag()
    lazy var code = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}

extension DetailTableViewController{
    func setUp(){
        detailKinderViewModel.currentKinder
            .asDriver(onErrorJustReturn:Kinder())
            .map{$0.name}
            .drive(self.navigationItem.rx.title)
            .disposed(by: disposeBag)
        
        detailKinderViewModel.currentKinder
            .subscribe(onNext: { kinder in
                self.officeLabel.text = kinder.office
                self.subOfficeLabel.text = kinder.sub_office
                self.kindLabel.text = kinder.kind
                self.ownerLabel.text = kinder.owner
                self.headTeacherLabel.text = kinder.headTeacher
                self.establishLabel.text = kinder.edate
                self.openDateLabel.text = kinder.odate
                self.operTimeLabel.text = kinder.opertime
                self.addressLabel.text = kinder.addr
                self.telLabel.text = kinder.tel
                self.linkLabel.text = kinder.url
                self.code = kinder.code
            })
            .disposed(by: disposeBag)

        
        tableView.rx.itemSelected
            .subscribe(onNext: { index in
                switch index.section{
                case 1:
                    switch index.row {
                    case 0:
                        print(self.addressLabel.text!)
                    case 1:
                        if let url = URL(string: "tel://\(self.telLabel.text!)") {
                            UIApplication.shared.open(url, options: [:])
                        }
                    case 2:
                        if let url = URL(string: self.linkLabel.text!) {
                            UIApplication.shared.open(url, options: [:])
                        }
                    default:
                        break
                    }
                case 2:
                    switch index.row {
                    case 0:
                        self.performSegue(withIdentifier: "showSystem", sender: nil)
                    case 1:
                        self.performSegue(withIdentifier: "showStaff", sender: nil)
                    case 2:
                        self.performSegue(withIdentifier: "showFood", sender: nil)
                    case 3:
                        self.performSegue(withIdentifier: "showInspect", sender: nil)
                    case 4:
                        self.performSegue(withIdentifier: "showHygiene", sender: nil)
                    case 5:
                        self.performSegue(withIdentifier: "showEtc", sender: nil)
                    default:
                        break
                    }
                default:
                    break
                }
            })
            .disposed(by: disposeBag)
    }
}

extension DetailTableViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        switch segue.identifier{
        case "showSystem":
            let vc = segue.destination as! SystemTableViewController
            self.detailKinderViewModel.currentKinder
                .asDriver()
                .map{$0.code}
                .drive(vc.systemKinderViewModel.code)
                .disposed(by: disposeBag)
            self.detailKinderViewModel.cityId
                .asDriver()
                .drive(vc.systemKinderViewModel.cityId)
                .disposed(by: disposeBag)
        case "showStaff":
            let vc = segue.destination as! StaffTableViewController
            self.detailKinderViewModel.currentKinder
                .asDriver()
                .map{$0.code}
                .drive(vc.staffKinderViewModel.code)
                .disposed(by: disposeBag)
            self.detailKinderViewModel.cityId
                .asDriver()
                .drive(vc.staffKinderViewModel.cityId)
                .disposed(by: disposeBag)
        case "showFood":
            let vc = segue.destination as! FoodTableViewController
            self.detailKinderViewModel.currentKinder
                .asDriver()
                .map{$0.code}
                .drive(vc.foodKinderViewModel.code)
                .disposed(by: disposeBag)
            self.detailKinderViewModel.cityId
                .asDriver()
                .drive(vc.foodKinderViewModel.cityId)
                .disposed(by: disposeBag)
        case "showInspect":
            let vc = segue.destination as! InspectTableViewController
            self.detailKinderViewModel.currentKinder
                .asDriver()
                .map{$0.code}
                .drive(vc.inspectKinderVIewModel.code)
                .disposed(by: disposeBag)
            self.detailKinderViewModel.cityId
                .asDriver()
                .drive(vc.inspectKinderVIewModel.cityId)
                .disposed(by: disposeBag)
        case "showHygiene":
            let vc = segue.destination as! HygieneTableViewController
            self.detailKinderViewModel.currentKinder
                .asDriver()
                .map{$0.code}
                .drive(vc.hygieneKinderViewModel.code)
                .disposed(by: disposeBag)
            self.detailKinderViewModel.cityId
                .asDriver()
                .drive(vc.hygieneKinderViewModel.cityId)
                .disposed(by: disposeBag)
        case "showEtc":
            let vc = segue.destination as! EtcTableViewController
            self.detailKinderViewModel.currentKinder
                .asDriver()
                .map{$0.code}
                .drive(vc.etcKinderViewModel.code)
                .disposed(by: disposeBag)
            self.detailKinderViewModel.cityId
                .asDriver()
                .drive(vc.etcKinderViewModel.cityId)
                .disposed(by: disposeBag)
        default :
            return
        }
    }
}


