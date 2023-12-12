//
//  Create.swift
//  RxSwift-Demo
//
//  Created by 3rabApp-oday on 11/12/2023.
//

import Foundation
import RxSwift





enum myError:Error {
    case error
}

/*
 -  i will write and define what it will be emited at every case
 -  If you not emit error or complete it still open (listen/ observe) until send one of them
 
 */


class Create {
    
    private let observable = Observable<String>.create { observer in
        observer.onNext("a")
        observer.onNext("b")
        observer.onError(myError.error)

        return Disposables.create()
    }
    private let observable1 = Observable<String>.create { observer in
        observer.onNext("a")
        observer.onNext("b")
        observer.onCompleted()
        return Disposables.create()
    }
    private let observable2 = Observable<String>.create { observer in
        observer.onNext("a")
        observer.onNext("b")
        return Disposables.create()
    }
    private let disposeBag = DisposeBag()
    
    
    func subscribeOnCreate(){
       print("==================== Create ====================")
        runSubscriber_EmitError()
        runSubscriber_Emitcomplete()
        runSubscriber_EmitNextOnly()
   }
    
    private func runSubscriber_EmitError(){
        print("--------->EMIT WITH ERROR")
        observable.subscribe { char in
            print(char)
        } onError: { _ in
            print("error")
        } onCompleted: {
            print("complete")
        } onDisposed: {
            print("disposed")
        }.disposed(by: disposeBag)
    }
    private func runSubscriber_Emitcomplete(){
        print("---------> EMIT WITH COMPLETE")
        observable1.subscribe { char in
            print(char)
        } onError: { _ in
            print("error")
        } onCompleted: {
            print("complete")
        } onDisposed: {
            print("disposed")
        }.disposed(by: disposeBag)
    }
    private func runSubscriber_EmitNextOnly(){
        print("---------> WITHOUT ERRROR AND COMPLETE")
        observable2.subscribe { char in
            print(char)
        } onError: { _ in
            print("error")
        } onCompleted: {
            print("complete")
        } onDisposed: {
            print("disposed")
        }.disposed(by: disposeBag)
    }
}
