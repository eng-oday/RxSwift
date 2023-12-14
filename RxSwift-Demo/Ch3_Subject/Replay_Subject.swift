//
//  Replay_Subject.swift
//  RxSwift-Demo
//
//  Created by 3rabApp-oday on 12/12/2023.
//

import Foundation
import RxSwift
import RxRelay



// قولي بس انت عايز ايه وعنيا ليك


class Replay_Subject {
    
    private let disposeBag           = DisposeBag()
    private let replay_Subject       = ReplaySubject<String>.create(bufferSize: 2)
        
    func subscribeOn_Replay_Subject(){
        print("==================== Replay_Subject ====================")
        runSubscriber()
        
    }
    private func runSubscriber(){
        replay_Subject.onNext("1")
        replay_Subject.onNext("2")
        replay_Subject.onNext("3")
        
        replay_Subject.subscribe{
            print("i'm 1 subscriber entered after 3 but i get ",$0.element ?? $0)
        }.disposed(by: disposeBag)
        
        replay_Subject.onError(myError.error)
        
        replay_Subject.dispose() //Explicitly calling dispose() on a replay subject like this isn’t something you generally need to do
        
        replay_Subject.subscribe{
            print("i'm 2 subscriber entered after 3 but i get ",$0.element ?? $0)
        }.disposed(by: disposeBag)
        
        
        //replay_Subject.onError(myError.error)
    }
}
