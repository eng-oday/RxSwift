//
//  Deferred.swift
//  RxSwift-Demo
//
//  Created by 3rabApp-oday on 11/12/2023.
//

import Foundation
import RxSwift

/*
 - it’s possible to create observable factories that vend a new observable to each subscriber.
 
 - in this example in first oberve u will got 1 ,2 ,3 and second one you will got 4 , 5 , 6
 */

class Deferred {
    
    private var flip        = false
    private let disposeBag  = DisposeBag()

    private func createObservable()-> Observable<Int>{
        let observable: Observable<Int> = Observable.deferred { [weak self] in
            guard let self else {return Observable.empty()}
            self.flip = !self.flip
            if self.flip {
                return Observable.of(1, 2, 3)
            } else {
                return Observable.of(4, 5, 6)
            }
        }
        return observable
    }

    func subscribeOnDeferred(){
       print("==================== Deferred ====================")
        runSubscriber()
   }
    
    private func runSubscriber(){
        let observable = createObservable()
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
