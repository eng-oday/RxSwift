//
//  Share.swift
//  RxSwift-Demo
//
//  Created by 3rabApp-oday on 18/12/2023.
//

import Foundation
import RxSwift


class Share {
    
    let disposeBag  = DisposeBag()
    var start       = 0
    
    lazy var numbers     = Observable<Int>.create {  observer in
        let start        = self.getStartNumber()
        observer.onNext(start)
        observer.onNext(start+1)
        observer.onNext(start+2)
        observer.onCompleted()
        return Disposables.create()
    }
    
    func exampleOn_Sharing(){
        print("==================== Sharing ====================")
        run_Without_Sharing()
        run_Sharing()
    }
    
    private func run_Without_Sharing(){
        print("==================== Without_Sharing ====================")
        numbers
            .subscribe(onNext: { el in
                print("element [\(el)]")
            }, onCompleted: {
                print("-------------")
            })
    }
    
    private func run_Sharing(){
        print("==================== Sharing ====================")
        numbers
            .subscribe(onNext: { el in
                print("element [\(el)]")
            }, onCompleted: {
                print("-------------")
            })
    }
    
     private func getStartNumber() -> Int {
        start += 1
        return start
    }
    
}
