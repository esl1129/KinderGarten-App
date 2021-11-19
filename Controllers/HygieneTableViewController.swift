//
//  HygieneTableViewController.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/11/04.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

class HygieneTableViewController: UITableViewController {
    let hygieneKinderViewModel = HygieneKinderViewModel()
    let disposeBag = DisposeBag()

    @IBOutlet weak var airDtLabel: UILabel!
    @IBOutlet weak var airRsLabel: UILabel!
    @IBOutlet weak var dinfChkLabel: UILabel!
    @IBOutlet weak var dinfDtLabel: UILabel!
    @IBOutlet weak var dinfRsLabel: UILabel!
    @IBOutlet weak var msDtLabel: UILabel!
    @IBOutlet weak var illuDtLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

}

extension HygieneTableViewController{
    func setUp(){
        hygieneKinderViewModel.currentHygiene
            .subscribe(onNext: { inspect in
                self.navigationItem.title = inspect.name
                self.airDtLabel.text = inspect.air_dt
                self.airRsLabel.text = inspect.air_rs
                self.dinfChkLabel.text = inspect.dinf_chk
                self.dinfDtLabel.text = inspect.dinf_dt
                self.dinfRsLabel.text = inspect.dinf_rs
                self.msDtLabel.text = inspect.mdst_dt
                self.illuDtLabel.text = inspect.illu_dt
               
            })
            .disposed(by: disposeBag)
    }
}
