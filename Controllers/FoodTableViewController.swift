//
//  FoodTableViewController.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/11/01.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

class FoodTableViewController: UITableViewController {
    @IBOutlet weak var kindLabel: UILabel!
    @IBOutlet weak var childCntLabel: UILabel!
    @IBOutlet weak var privateNutLabel: UILabel!
    @IBOutlet weak var publicNutLabel: UILabel!
    @IBOutlet weak var chefLabel: UILabel!
    @IBOutlet weak var assistantLabel: UILabel!
    @IBOutlet weak var declarationLabel: UILabel!
    
    @IBOutlet weak var vhclLabel: UILabel!
    @IBOutlet weak var opraLabel: UILabel!
    @IBOutlet weak var dclrLabel: UILabel!
    @IBOutlet weak var psg9Label: UILabel!
    @IBOutlet weak var psg12Label: UILabel!
    @IBOutlet weak var psg15Label: UILabel!
    let foodKinderViewModel = FoodKinderViewModel()
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}

extension FoodTableViewController{
    func setUp(){
        foodKinderViewModel.currentFood
            .subscribe(onNext: { food in
                self.navigationItem.title = food.name
                self.kindLabel.text = food.kind
                self.childCntLabel.text = food.childCnt
                self.privateNutLabel.text = food.privateNut
                self.publicNutLabel.text = food.publicNut
                self.chefLabel.text = food.chef
                self.assistantLabel.text = food.assistant
                self.declarationLabel.text = food.declaration
            })
            .disposed(by: disposeBag)
        foodKinderViewModel.currentBus
            .subscribe(onNext: { bus in
                self.vhclLabel.text = bus.chk
                self.opraLabel.text = bus.operation
                self.dclrLabel.text = bus.declaration
                self.psg9Label.text = bus.psg9
                self.psg12Label.text = bus.psg12
                self.psg15Label.text = bus.psg15
            })
            .disposed(by: disposeBag)
    }
}
