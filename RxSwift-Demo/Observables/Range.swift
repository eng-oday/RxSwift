//
//  Range.swift
//  RxSwift-Demo
//
//  Created by 3rabApp-oday on 11/12/2023.
//

import Foundation
import RxSwift


/*
    - it's possible to generate an observable from a range of values.
 */

class Range {
    private let observable = Observable<Int>.range(start: 0, count: 6)
    private let disposeBag  = DisposeBag()
    
    func subscribeOnNever(){
       print("==================== Range ====================")
        runSubscriber()
   }
    
    private func runSubscriber(){
        observable.subscribe { names in
            print(names)
        } onError: { _ in
            print("error")
        } onCompleted: {
            print("complete")
        } onDisposed: {
            print("disposed")
        }.disposed(by: disposeBag)

    }
}
