//
//  RxFSPageControl.swift
//  RxPagerView
//
//  Created by yangkejun on 2021/12/3.
//

import RxSwift
import class FSPagerView.FSPageControl

public extension Reactive where Base: FSPageControl {
    
    var numberOfPages: Binder<Int> {
        return Binder(base) {
            $0.numberOfPages = $1
        }
    }
    
    var currentPage: Binder<Int> {
        return Binder(base) {
            $0.currentPage = $1
        }
    }
}
