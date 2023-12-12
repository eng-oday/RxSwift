//
//  Publish_Subject.swift
//  RxSwift-Demo
//
//  Created by 3rabApp-oday on 12/12/2023.
//

import Foundation
import RxSwift
import RxRelay


//الي غايب مالوش نايب

class Publish_Subject{
    
    private let disposeBag           = DisposeBag()
    private let publish_Subject      = PublishSubject<String>()
    
    
    
    func subscribeOn_Publish_Subject(){
        print("==================== Publish_Subject ====================")
        runSubscriber()
    }
    
    
    private func runSubscriber(){
        publish_Subject.onNext("the First One") //  No One can see this because they subscribe after he emited
        
        let firstSubscribe = publish_Subject
            .subscribe(onNext:{ element in
                print("firstSubscribe see --> \(element)")
            })
        
        publish_Subject.onNext("Ahmed")
        
        let secondSubscribe = publish_Subject
            .subscribe(onNext:{ element in
                print("secondSubscribe see --> \(element)")
            })
        
        publish_Subject.onNext("oday")
        
        firstSubscribe.dispose()
        
        //  firstSubscribe can can't see this because i disposed before i emit it
        publish_Subject.onNext("firstSubscribe is out now right?")
        
        publish_Subject.onCompleted()
        
        publish_Subject.onNext("can u see me now after i completed ?")
        
        secondSubscribe.dispose()
        
         publish_Subject
            .subscribe {
                print("publish_Subject event -->",$0.element ?? $0)
            }.disposed(by: disposeBag)
         
        publish_Subject.onNext("?")
    }
}
