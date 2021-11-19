//
//  InspectTableViewController.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/11/02.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

class InspectTableViewController: UITableViewController {
    let inspectKinderVIewModel = InspectKinderVIewModel()
    @IBOutlet weak var fireChkLabel: UILabel!
    @IBOutlet weak var fireDtLabel: UILabel!
    @IBOutlet weak var gasChkLabel: UILabel!
    @IBOutlet weak var gasDtLabel: UILabel!
    @IBOutlet weak var fireSafeChkLabel: UILabel!
    @IBOutlet weak var fireSafeDtLabel: UILabel!
    @IBOutlet weak var elecChkLabel: UILabel!
    @IBOutlet weak var elecDtLabel: UILabel!
    @IBOutlet weak var plygChkLabel: UILabel!
    @IBOutlet weak var plygDtLabel: UILabel!
    @IBOutlet weak var plygRsLabel: UILabel!
    @IBOutlet weak var cctvChkLabel: UILabel!
    @IBOutlet weak var cctvTotalLabel: UILabel!
    @IBOutlet weak var cctvInLabel: UILabel!
    @IBOutlet weak var cctvOutLabel: UILabel!
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()

    }

}

extension InspectTableViewController{
    func setUp(){
        inspectKinderVIewModel.currentInspect
            .subscribe(onNext: { inspect in
                self.navigationItem.title = inspect.name
                self.fireChkLabel.text = inspect.fire_chk
                self.fireDtLabel.text = inspect.fire_dt
                self.gasChkLabel.text = inspect.gas_chk
                self.gasDtLabel.text = inspect.gas_dt
                self.fireSafeChkLabel.text = inspect.fire_safe_chk
                self.fireSafeDtLabel.text = inspect.fire_safe_dt
                self.elecChkLabel.text = inspect.elec_chk
                self.elecDtLabel.text = inspect.elec_dt
                self.plygChkLabel.text = inspect.plyg_chk
                self.plygDtLabel.text = inspect.plyg_dt
                self.plygRsLabel.text = inspect.plyg_rs
                self.cctvChkLabel.text = inspect.cctv_chk
                self.cctvTotalLabel.text = inspect.cctv_total_cnt
                self.cctvInLabel.text = inspect.cctv_in_cnt
                self.cctvOutLabel.text = inspect.cctv_out_cnt
            })
            .disposed(by: disposeBag)
    }
}
