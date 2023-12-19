//
//  FilteringOperator.swift
//  RxSwift-Demo
//
//  Created by 3rabApp-oday on 14/12/2023.
//

import Foundation
import RxSwift


class Filtering_Opertaor{
    
    let disposeBag                         = DisposeBag()
    
    func exampleOn_Filtering_Opertaor(){
        print("==================== Filtering_Opertaor ====================")
        print("=")
        print("=")
        run_Ignore_Elements()
        run_elementAt()
        run_Filter()
        run_Skip()
        run_Skip_while()
        run_Skip_Until()
        run_Take()
        run_Take_While()
        run_Take_Until()
        run_Distinict_Until_Changed()
    }
    private func run_Ignore_Elements(){
        print("==================== ignore_Element ====================")
        let publish_Subject_ignore_Element     = PublishSubject<String>()
        publish_Subject_ignore_Element
            .ignoreElements()
            .subscribe { element in
                print(element)
            }.disposed(by: disposeBag)
        
        
        publish_Subject_ignore_Element.onNext("X")
        publish_Subject_ignore_Element.onNext("X")
        publish_Subject_ignore_Element.onNext("X")
        
        publish_Subject_ignore_Element.onCompleted()
    }
    
    private func run_elementAt(){
        print("==================== element_At ====================")
        let elemenAt_Puclish_Subject           = PublishSubject<String>()
        elemenAt_Puclish_Subject
            .element(at: 2)
            .subscribe { element in
                print(element)
            }.disposed(by: disposeBag)
        
        
        elemenAt_Puclish_Subject.onNext("i'm 0 index")
        elemenAt_Puclish_Subject.onNext("i'm 1 index")
        elemenAt_Puclish_Subject.onNext("i'm 2 index")
    }
    
    private func run_Filter(){
        print("==================== Filter ====================")
        
        Observable.from([1,2,3,4,5,6,7,8])
            .filter { everyElemnt in
                everyElemnt % 2 == 0
            }
            .subscribe { elementAfterFiltering in
                print(elementAfterFiltering)
            }.disposed(by: disposeBag)
    }
    
    private func run_Skip(){
        print("==================== Skip ====================")
        Observable.of(1,2,3,4,5,6,7,8,9)
            .skip(4)
            .subscribe { elementAfterFiltering in
                print(elementAfterFiltering)
            }.disposed(by: disposeBag)
    }
    
    private func run_Skip_while(){
        print("==================== Skip_While ====================")
        Observable.of(2,2,3,4,4)
            .skip(while: { element in
                element % 2 == 0
            })
            .subscribe { elementAfterFiltering in
                print(elementAfterFiltering)
            }.disposed(by: disposeBag)
    }
    
    private func run_Skip_Until(){
        print("==================== Skip_Until ====================")
        
        let publishSubject  = PublishSubject<String>()
        let trigger         = PublishSubject<String>()
        
        publishSubject.skip(until: trigger)
            .subscribe { element in
                print(element)
            }.disposed(by: disposeBag)
        
        publishSubject.onNext("A")
        publishSubject.onNext("B")
        trigger.onNext("Hi")
        publishSubject.onNext("C")
    }
    
    private func run_Take(){
        
        // What you take is what you get
        print("==================== Take ====================")
        Observable.of(1,2,3,4,5,6,7)
            .take(4) //take four element so in print i will get first four element
            .subscribe { element in
            print(element)
        }.disposed(by: disposeBag)
        
        
    }
    
    private func run_Take_While(){
        print("==================== Take_While ====================")
        Observable.of(2,6,4,4,6,6)
            .enumerated()
            .take(while: { (index: Int, element: Int) in
                // index > 1 -> here it will not return any value because the condition it fail , and condition if fail it will terminate
                index < 1
            }).map{
                $0.element
            }
            .subscribe { element in
                print(element)
            }.disposed(by: disposeBag)
        
    }

    private func run_Take_Until(){
        print("==================== Take_Until ====================")

        let pusblish_Subject    = PublishSubject<Int>()
        let trigger             = PublishSubject<Int>()
        pusblish_Subject.take(until: trigger).subscribe { element in
            print(element)
        }.disposed(by: disposeBag)
        
        pusblish_Subject.onNext(1)
        pusblish_Subject.onNext(2)
        trigger.onNext(3)
        pusblish_Subject.onNext(4)

    }
    
    private func run_Distinict_Until_Changed(){
        print("==================== Distinict_Until_Changed ====================")
        
        Observable.of(1,1,2,2,3,4,4,5,6,3)
            .distinctUntilChanged()
            .subscribe { element in
                print(element)
            }.disposed(by: disposeBag)

    }
}
