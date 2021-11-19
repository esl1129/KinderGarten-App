//
//  StaffTableViewController.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/11/01.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

class StaffTableViewController: UITableViewController {
    let staffKinderViewModel = StaffKinderViewModel()
    let disposeBag = DisposeBag()
    @IBOutlet weak var ledgerLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var generalLabel: UILabel!
    @IBOutlet weak var specialLabel: UILabel!
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var nutritionLabel: UILabel!
    @IBOutlet weak var fixTermLabel: UILabel!
    @IBOutlet weak var officeLabel: UILabel!
    @IBOutlet weak var headQaLabel: UILabel!
    @IBOutlet weak var orthodox1Label: UILabel!
    @IBOutlet weak var orthodox2Label: UILabel!
    @IBOutlet weak var associateLabel: UILabel!
    @IBOutlet weak var yy1_under_Label: UILabel!
    @IBOutlet weak var yy1_yy2_Label: UILabel!
    @IBOutlet weak var yy2_yy4_Label: UILabel!
    @IBOutlet weak var yy4_yy6_Label: UILabel!
    @IBOutlet weak var yy6_over_Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}

extension StaffTableViewController{
    func setUp(){
        staffKinderViewModel.currentStaff
            .subscribe(onNext: { staff in
                self.navigationItem.title = staff.name
                self.ledgerLabel.text = staff.ledger
                self.directorLabel.text = staff.director
                self.headLabel.text = staff.head
                self.positionLabel.text = staff.pos
                self.generalLabel.text = staff.general
                self.specialLabel.text = staff.special
                self.healthLabel.text = staff.health
                self.nutritionLabel.text = staff.nutrition
                self.fixTermLabel.text = staff.fixTerm
                self.officeLabel.text = staff.office
                self.headQaLabel.text = staff.headQa
                self.orthodox1Label.text = staff.orthodox1
                self.orthodox2Label.text = staff.orthodox2
                self.associateLabel.text = staff.associate
            })
            .disposed(by: disposeBag)
        staffKinderViewModel.currentStaffYear
            .subscribe(onNext: { staffYear in
                self.yy1_under_Label.text = staffYear._0to1
                self.yy1_yy2_Label.text = staffYear._1to2
                self.yy2_yy4_Label.text = staffYear._2to4
                self.yy4_yy6_Label.text = staffYear._4to6
                self.yy6_over_Label.text = staffYear._over6
            })
            .disposed(by: disposeBag)
        
    }
}
