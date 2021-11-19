//
//  SystemTableViewController.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/11/01.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

class SystemTableViewController: UITableViewController {
    @IBOutlet weak var kindLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var floorLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var totalAreaLabel: UILabel!
    @IBOutlet weak var classCntLabel: UILabel!
    @IBOutlet weak var classAreaLabel: UILabel!
    @IBOutlet weak var gymLabel: UILabel!
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var nutLabel: UILabel!
    @IBOutlet weak var etcLabel: UILabel!
    let systemKinderViewModel = SystemKinderViewModel()
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}

extension SystemTableViewController{
    func setUp(){
        systemKinderViewModel.currentSystem
            .subscribe(onNext: { sys in
                self.navigationItem.title = sys.name
                self.kindLabel.text = sys.kind
                self.yearLabel.text = sys.year
                self.floorLabel.text = sys.floor
                self.areaLabel.text = sys.area
                self.totalAreaLabel.text = sys.total_area
            })
            .disposed(by: disposeBag)
        
        systemKinderViewModel.currentClass
            .subscribe(onNext: { cls in
                self.classCntLabel.text = cls.clsCnt
                self.classAreaLabel.text = cls.clsArea
                self.gymLabel.text = cls.gymArea
                self.healthLabel.text = cls.healthArea
                self.nutLabel.text = cls.nutArea
                self.etcLabel.text = cls.etcArea
            })
            .disposed(by: disposeBag)
    }
}
