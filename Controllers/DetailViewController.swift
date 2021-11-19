//
//  DetailViewController.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/10/28.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

class DetailViewController: UIViewController {

    let detailKinderViewModel = DetailKinderViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}

extension DetailViewController{
    func setUp(){
        detailKinderViewModel.currentModel
            .asDriver(onErrorJustReturn: Kinder())
            .map{String($0.kinder_name)}
            .drive(self.navigationItem.rx.title)
            .disposed(by: disposeBag)
        
        detailKinderViewModel.currentModel
            .subscribe(onNext: { model in
                print(model.kinder_name)
            })
            .disposed(by: disposeBag)
    }
    
}
