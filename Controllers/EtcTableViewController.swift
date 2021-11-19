//
//  EtcTableViewController.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/11/04.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa
class EtcTableViewController: UITableViewController {
    let etcKinderViewModel = EtcKinderViewModel()
    let disposeBag = DisposeBag()
    @IBOutlet weak var rdLabel: UILabel!
    @IBOutlet weak var foLabel: UILabel!
    @IBOutlet weak var fiLabel: UILabel!
    @IBOutlet weak var mixLabel: UILabel!
    @IBOutlet weak var scLabel: UILabel!
    @IBOutlet weak var afLabel: UILabel!
    
    @IBOutlet weak var schChkLabel: UILabel!
    @IBOutlet weak var schEnLabel: UILabel!
    @IBOutlet weak var eduChkLabel: UILabel!
    @IBOutlet weak var eduEnLabel: UILabel!
    
    @IBOutlet weak var insNameLabel: UILabel!
    @IBOutlet weak var insComLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}

extension EtcTableViewController{
    func setUp(){
        etcKinderViewModel.currentLesson
            .subscribe(onNext: { lesson in
                self.navigationItem.title = lesson.name
                self.rdLabel.text = lesson.rdDt
                self.foLabel.text = lesson.foDt
                self.fiLabel.text = lesson.fiDt
                self.mixLabel.text = lesson.mixDt
                self.scLabel.text = lesson.scDt
                self.afLabel.text = lesson.afDt
            })
            .disposed(by: disposeBag)
        etcKinderViewModel.currentSociety
            .subscribe(onNext: { society in
                self.schChkLabel.text = society.schChk
                self.schEnLabel.text = society.schEn
                self.eduChkLabel.text = society.eduChk
                self.eduEnLabel.text = society.eduEn
            })
            .disposed(by: disposeBag)
        etcKinderViewModel.currentInsurance
            .subscribe(onNext: { insurance in
                self.insNameLabel.text = insurance.insName
                self.insComLabel.text = insurance.company
            })
            .disposed(by: disposeBag)
    }
}
