//
//  From.swift
//  RxSwift-Demo
//
//  Created by 3rabApp-oday on 11/12/2023.
//

import Foundation
import RxSwift
class From {
    /*
     The from operator creates an observable of individual type instances from a regular array of elements. Option-click on observable4 and you’ll see that it is an Observable of Int, not [Int].
     - The from operator only takes an array.
     */
    private let obserVable  = Observable.from(["oday","ahmed","mohammed","asser"])
    private let disposeBag  = DisposeBag()
    
    func subscribeOnFrom(){
        print("==================== FROM ====================")
        runSubscriber()
    }
    
    private func runSubscriber(){
        obserVable.subscribe { item in
            print(item)
        } onError: { _ in
            print("error")
        } onCompleted: {
            print("complete")
        } onDisposed: {
            print("dispose")
        }.disposed(by: disposeBag)

    }
}
