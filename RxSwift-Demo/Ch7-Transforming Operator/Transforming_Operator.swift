//
//  Transforming Operator.swift
//  RxSwift-Demo
//
//  Created by 3rabApp-oday on 19/12/2023.
//

import Foundation
import RxSwift


class Transforming_Operator {
    
    
    let disposeBag      = DisposeBag()
    
    
    func exampleOn_Transforming_Operator(){
        print("==================== Transforming_Operator ====================")
        print("=")
        run_To_Array()
        run_Map()
        run_enumerated_and_map()
        run_Flat_Map()
        run_Flat_Map_Latest()
        run_Without_Materialize()
        run_With_Materialize()
        run_dematerialize()
    }
    
    
    
    private func run_To_Array(){
        print("==================== To_Array ====================")
        
        Observable.of(1,2,3)
            .toArray()
            .subscribe({
                print($0)
            })
            .disposed(by: disposeBag)
    }
    
    private func run_Map(){
        print("==================== Map ====================")
        Observable.of(2,4,6,8)
            .map{ element in
                element * 2
            }
            .subscribe(onNext:{
                print($0)
            }).disposed(by: disposeBag)
    }
    
    private func run_enumerated_and_map(){
        print("==================== enumerated_and_map ====================")
        Observable.of(1,2,3,4,5,6)
            .enumerated() // it produce tuple pairs of each element and its index
            .map{ index , integer in
                index > 2 ? integer * 2 : integer
            }
            .subscribe(onNext:{
                print($0)
            }).disposed(by: disposeBag)
    }
    private func run_Flat_Map(){
        print("==================== Flat_Map ====================")
        let oday    = Student(score: BehaviorSubject<Int>(value: 80))
        let saly    = Student(score: BehaviorSubject<Int>(value: 90))
        
        let student = PublishSubject<Student>()
        
        student
            .flatMap {
                $0.score
            }
            .subscribe(onNext:{
                print($0)
            }).disposed(by: disposeBag)
        
        student.onNext(oday)
        oday.score.onNext(85)
        student.onNext(saly)
        saly.score.onNext(95)
        oday.score.onNext(100)
    }
    
    private func run_Flat_Map_Latest(){
        print("==================== Flat_Map_Latest ====================")
        let oday        = Student(score: BehaviorSubject<Int>(value: 80))
        let saly        = Student(score: BehaviorSubject<Int>(value: 90))
        let mohammed    = Student(score: BehaviorSubject<Int>(value: 500))
        
        let student = PublishSubject<Student>()
        
        student
            .flatMapLatest {
                $0.score
            }
            .subscribe(onNext:{
                print($0)
            }).disposed(by: disposeBag)
        
        student.onNext(oday)
        oday.score.onNext(85)
        student.onNext(saly)
        oday.score.onNext(100)
        saly.score.onNext(95)
        student.onNext(mohammed)
        mohammed.score.onNext(300)
        mohammed.score.onNext(400)
        saly.score.onNext(900)
    }
    
    private func run_Without_Materialize(){
        print("==================== Without_Materialize ====================")
        let ryan        = Student(score: BehaviorSubject(value: 80))
        let charlotte   = Student(score: BehaviorSubject(value: 100))
        
        let student     = BehaviorSubject<Student>(value: ryan)
        
        let studentScore = student.flatMapLatest {
            $0.score
        }
        
        studentScore.subscribe(onNext:{
            print($0)
        }).disposed(by: disposeBag)
        // 3
        ryan.score.onNext(85)
        ryan.score.onError(myError.error)
        ryan.score.onNext(90)
        // 4
        student.onNext(charlotte)
        
    }
    
    private func run_With_Materialize(){
        print("==================== With_Materialize ====================")
        let ryan        = Student(score: BehaviorSubject(value: 80))
        let charlotte   = Student(score: BehaviorSubject(value: 100))
        
        let student     = BehaviorSubject<Student>(value: ryan)
        
        let studentScore = student.flatMapLatest {
            $0.score.materialize()
        }
        
        studentScore.subscribe(onNext:{
            print($0)
        }).disposed(by: disposeBag)
        // 3
        ryan.score.onNext(85)
        ryan.score.onError(myError.error)
        ryan.score.onNext(90)
        // 4
        student.onNext(charlotte)
        
    }
    
    private func run_dematerialize(){
        print("==================== dematerialize ====================")
        let ryan        = Student(score: BehaviorSubject(value: 80))
        let charlotte   = Student(score: BehaviorSubject(value: 100))
        
        let student     = BehaviorSubject<Student>(value: ryan)
        
        let studentScore = student.flatMapLatest {
            $0.score.materialize()
        }
        
        studentScore
        // 1
          .filter {
            guard $0.error == nil else {
              print($0.error!)
        return false
        }
        return true
        }
        // 2
          .dematerialize()
          .subscribe(onNext: {
        print($0) })
          .disposed(by: disposeBag)
        
        
        // 3
        ryan.score.onNext(85)
        ryan.score.onError(myError.error)
        ryan.score.onNext(90)
        // 4
        student.onNext(charlotte)
        
    }
    
}
