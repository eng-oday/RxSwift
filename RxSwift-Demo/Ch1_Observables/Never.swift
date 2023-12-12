//
//  Never.swift
//  RxSwift-Demo
//
//  Created by 3rabApp-oday on 11/12/2023.
//

import Foundation
import RxSwift

/*
 -  the never operator creates an observable that doesn’t emit anything and never terminates. It can be use to represent an infinite duration
 
 -  useful operator for when you want to do some side work that doesn’t affect the observable you’re working with
 */

class Never {
    private let observable = Observable<Void>.never()
    private let disposeBag  = DisposeBag()
    
    func subscribeOnNever(){
       print("==================== Never ====================")
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

