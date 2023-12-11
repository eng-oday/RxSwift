//
//  Just.swift
//  RxSwift
//
//  Created by 3rabApp-oday on 11/12/2023.
//

import Foundation
import RxSwift


class Just {
    /*
      You can guess from his name it just emit only one value
     */
    private let JustObservable:Observable<Int> = Observable.just(1)
    private let disposeBag = DisposeBag()
    func SubscribeOnJust(){
        print("==================== Just ====================")
        runSubscriber()
    }
    
    private func runSubscriber(){
        JustObservable.subscribe { element in
            // 1. ON NEXT
            print(element)
        } onError: { error in
            print("error")
        } onCompleted: {
            print("complete")
        } onDisposed: {
            print("Disposed")
        }.disposed(by:disposeBag)
    }
    
}
