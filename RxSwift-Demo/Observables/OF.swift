//
//  OF.swift
//  RxSwift-Demo
//
//  Created by 3rabApp-oday on 11/12/2023.
//

import Foundation
import RxSwift



class OF {
    
    /*
        - it take every single parameter and return it as he as , if you pass array it will work with it like first parameter and emit it as single value
        - if you pass three names , it will emit three values
     */
    
    
    private let Observable_PassArray        = Observable.of(["oday" , "sara" , "yasmeen"])
    private let Observable_PassElements     = Observable.of("oday" , "sara" , "yasmeen")
    private let disposeBag                  = DisposeBag()
    
     func SubscribeOnOfObservable_PassArray(){
        print("==================== OF_PassArray ====================")
         runSubscriber_PassArray()
    }
    
    func SubscribeOnOfObservable_PassElements(){
       print("==================== OF_PassElements ====================")
        runSubscriber_PassElements()
   }
    
    private func runSubscriber_PassArray(){
        Observable_PassArray.subscribe { names in
            print(names)
        } onError: { _ in
            print("error")
        } onCompleted: {
            print("complete")
        } onDisposed: {
            print("disposed")
        }.disposed(by: disposeBag)

    }
    
    private func runSubscriber_PassElements(){
        Observable_PassElements.subscribe { names in
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
