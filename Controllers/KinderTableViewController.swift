//
//  KinderTableViewController.swift
//  K-KinderGarten
//
//  Created by 임재욱 on 2021/10/29.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa
import GoogleMobileAds

class KinderTableViewController: UITableViewController {
    @IBOutlet weak var sidoText: UITextView!
    @IBOutlet weak var cityText: UITextView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    let kinderViewModel = KinderViewModel()
    let disposeBag = DisposeBag()
    let sidoPickerView = UIPickerView()
    let cityPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = nil
        tableView.dataSource = nil
        setUp()
    }
}

extension KinderTableViewController{
    func setUp(){
        spinner.center = self.view.center
        
        cityText.rx.text.orEmpty
            .debounce(.milliseconds(100), scheduler: MainScheduler.instance)
            .asDriver(onErrorJustReturn: "")
            .drive(kinderViewModel.cityName)
            .disposed(by: disposeBag)
        
        sidoText.rx.text.orEmpty
            .debounce(.milliseconds(100), scheduler: MainScheduler.instance)
            .asDriver(onErrorJustReturn: "")
            .drive(kinderViewModel.doName)
            .disposed(by: disposeBag)
        
        
        kinderViewModel.kinderData
            .drive(tableView.rx.items(cellIdentifier: "kinderCell")){ _, kinder, cell in
                cell.textLabel?.text = kinder.name
                cell.detailTextLabel?.text = kinder.addr
            }
            .disposed(by: disposeBag)
        tableView.rx.modelSelected(Kinder.self)
            .subscribe(onNext: { model in
                self.performSegue(withIdentifier: "showDetail", sender: model)
            })
            .disposed(by: disposeBag)
        setPickerDrive()
        NotificationCenter.default.addObserver(self, selector: #selector(startSpin(_:)), name: Notification.Name("startSpin"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(stopSpin(_:)), name: Notification.Name("stopSpin"), object: nil)
    }
    
    func setPickerDrive() {
        kinderViewModel.doData
            .drive(sidoPickerView.rx.items){ _, do_name, view  in
                if let label = view as? UILabel{
                    return label
                }
                let label = UILabel()
                label.textAlignment = .center
                label.text = "\(do_name)"
                return label
            }.disposed(by: disposeBag)
        
        
        kinderViewModel.cityData
            .drive(cityPickerView.rx.items){ _, city_name, view  in
                if let label = view as? UILabel{
                    return label
                }
                let label = UILabel()
                label.textAlignment = .center
                label.text = "\(city_name)"
                return label
            }.disposed(by: disposeBag)
        
        
        sidoPickerView.rx.modelSelected(String.self)
            .subscribe(onNext: { city in
                self.sidoText.text = city[0]
            })
            .disposed(by: disposeBag)
        
        cityPickerView.rx.modelSelected(String.self)
            .subscribe(onNext: { city in
                self.cityText.text = city[0]
            })
            .disposed(by: disposeBag)
        
        setPickerView()
    }
    func setPickerView(){
        sidoPickerView.backgroundColor = UIColor(named: "mainback")
        sidoText.inputView = sidoPickerView
        cityPickerView.backgroundColor = UIColor(named: "mainback")
        cityText.inputView = cityPickerView
    }
}

extension KinderTableViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            guard let kinder = sender as? Kinder else {
                return
            }
            let vc = segue.destination as! DetailTableViewController
            vc.detailKinderViewModel.currentKinder = BehaviorRelay<Kinder>(value: kinder)
            self.kinderViewModel.cityId.bind(to: vc.detailKinderViewModel.cityId)
                .disposed(by: disposeBag)
        }
    }
    
    @objc func startSpin(_ notification: Notification) {
        self.spinner.startAnimating()
    }
    @objc func stopSpin(_ notification: Notification){
        self.spinner.stopAnimating()
    }
}
