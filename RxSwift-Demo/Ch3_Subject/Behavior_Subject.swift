//
//  Behavior_Subject.swift
//  RxSwift-Demo
//
//  Created by 3rabApp-oday on 12/12/2023.
//

import Foundation
import RxSwift
import RxRelay




// هديك اخر قيمه فاتتك


class Behavior_Subject {
    
    
    private let disposeBag           = DisposeBag()
    private let behavior_Subject     = BehaviorSubject(value:"this is initial value")
    

    
    func subscribeOn_Publish_Subject(){
        print("==================== Behavior_Subject ====================")
        runSubscriber()
        
    }
    private func runSubscriber(){
        
        
        behavior_Subject.onNext("first value sent")
        
        // 1. if No other elements have been added to the subject, so it replays the initial value to the subscriber
        // try to comment previous .next to see initial value
        behavior_Subject.subscribe{
            print("1",$0.element ?? $0)
        }.disposed(by: disposeBag)
        
        behavior_Subject.onError(myError.error)
        
        // - second subscriber
        behavior_Subject.subscribe{
            print("2",$0.element ?? $0)
        }.disposed(by: disposeBag)

    }
}
