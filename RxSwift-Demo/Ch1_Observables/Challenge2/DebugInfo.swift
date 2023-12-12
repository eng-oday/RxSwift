//
//  Challenge2.swift
//  RxSwift-Demo
//
//  Created by 3rabApp-oday on 12/12/2023.
//

import Foundation
import RxSwift



class Observables_Challenge2 {
    
    
    private let disposeBag          = DisposeBag()
    private let observable          = Observable<Any>.never()
    
    func subscribe_Observables_Challenge2(){
        print("==================== Observables_Challenge2 ====================")
        runSubscriber()
    }
    
    private func runSubscriber(){
        
        observable
            .debug("debugObservable")
            .subscribe { names in
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
