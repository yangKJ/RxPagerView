//
//  ViewController.swift
//  RxPagerView
//
//  Created by yangkejun on 2021/12/3.
//

import UIKit
import RxSwift
import FSPagerView

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    lazy var pageControl: FSPageControl = {
        let control = FSPageControl.init()
        control.setStrokeColor(UIColor.green, for: .selected)
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    lazy var pagerView: FSPagerView = {
        let pagerView = FSPagerView(frame: .zero)
        pagerView.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        pagerView.isInfinite = true
        pagerView.automaticSlidingInterval = 2
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "FSPagerViewCell")
        pagerView.translatesAutoresizingMaskIntoConstraints = false
        return pagerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
        setupBinding()
    }
    
    func setupUI() {
        view.addSubview(pagerView)
        view.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pagerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            pagerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            pagerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            pagerView.heightAnchor.constraint(equalTo: pagerView.widthAnchor, multiplier: 3/5),
            
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            pageControl.bottomAnchor.constraint(equalTo: pagerView.bottomAnchor, constant: -10),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
    }
    
func setupBinding() {
    let datasObserver = Observable.just(["luoza", "nini", "xiong", "yu"])
    
    datasObserver.bind(to: pagerView.rx.items()) { (row, element, cell) in
        cell.imageView?.image = UIImage(named: element)
    }.disposed(by: disposeBag)
    
    datasObserver.map { $0.count }.bind(to: pageControl.rx.numberOfPages).disposed(by: disposeBag)
    
    pagerView.rx.didSelectItemAtIndex.subscribe(onNext: { index in
        debugPrint("Did select index: " + "\(index)")
    }).disposed(by: disposeBag)
    
    pagerView.rx.pagerViewDidScroll.subscribe(onNext: { [weak self] index in
        self?.pageControl.currentPage = index
    }).disposed(by: disposeBag)
}
}

