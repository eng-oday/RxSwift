//
//  PerformSideEffect.swift
//  RxSwift-Demo
//
//  Created by 3rabApp-oday on 12/12/2023.
//

import Foundation
import RxSwift


/*
    erforming side effects is one way to help debug your Rx code
 */

class Observables_Challenge1 {
    
    private let disposeBag          = DisposeBag()
    private let observable          = Observable<Any>.never().do { _ in
    } afterNext: { _ in
        print("afterNext")
    } onError: { _ in
        print("onError")
    } afterError: { _ in
        print("afterError")
    } onCompleted: {
        print("onCompleted")
    } afterCompleted: {
        print("afterCompleted")
    } onSubscribe: {
        print("onSubscribe")
    } onSubscribed: {
        print("onSubscribed")
    } onDispose: {
        print("onDispose")
    }
    
    func subscribe_Observables_Challenge1(){
        print("==================== Observables_Challenge1 ====================")
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
