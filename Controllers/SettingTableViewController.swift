//
//  SettingTableViewController.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/11/19.
//

import UIKit

import RxSwift
import RxRelay
import RxCocoa
class SettingTableViewController: UITableViewController {
    let disposeBag = DisposeBag()
    @IBOutlet weak var displayStyleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}

extension SettingTableViewController{
    func setUp(){
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] index in
                guard let strongSelf = self else{
                    return
                }
                switch index.section{
                case 0:
                    switch index.row{
                    case 0:
                        if let window = UIApplication.shared.windows.first{
                            if window.overrideUserInterfaceStyle == .dark{
                                window.overrideUserInterfaceStyle = .light
                                strongSelf.displayStyleLabel.text = "다크 모드로 변경하기"
                            }else{
                                window.overrideUserInterfaceStyle = .dark
                                strongSelf.displayStyleLabel.text = "라이트 모드로 변경하기"
                            }
                        }
                        
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
