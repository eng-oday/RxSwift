//
//  Empty.swift
//  RxSwift-Demo
//
//  Created by 3rabApp-oday on 11/12/2023.
//

import Foundation
import RxSwift


/*
 they’re handy when you want to return an observable that immediately terminates, or intentionally has zero values.
 */

class Empty {
    private let observable = Observable<Void>.empty()
    private let disposeBag  = DisposeBag()
    
    func subscribeOnEmpty(){
       print("==================== Empty ====================")
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
