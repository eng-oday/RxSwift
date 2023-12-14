//
//  ViewController.swift
//  RxSwift-Demo
//
//  Created by 3rabApp-oday on 11/12/2023.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Observable
    let just                    = Just()
    let of                      = OF()
    let from                    = From()
    let empty                   = Empty()
    let never                   = Never()
    let range                   = Range()
    let create                  = Create()
    let deffered                = Deferred()
    //MARK: Ch1 Challenge
    let observables_Challenge1  = Observables_Challenge1()
    let observables_Challenge2  = Observables_Challenge2()
    
    
    //MARK: - Subject
    let puclishSubject      = Publish_Subject()
    let behavior_Subject    = Behavior_Subject()
    let replay_Subject      = Replay_Subject()
    
    
    //MARK: - FilterOperator
    let filtering_Operator      = Filtering_Opertaor()

    override func viewDidLoad() {
        super.viewDidLoad()
        run_Filtering_Operator()
    }

    private func run_Obervable_Examples(){
        just.SubscribeOnJust()
        of.SubscribeOnOfObservable_PassArray()
        of.SubscribeOnOfObservable_PassElements()
        from.subscribeOnFrom()
        empty.subscribeOnEmpty()
        never.subscribeOnNever()
        range.subscribeOnNever()
        create.subscribeOnCreate()
        deffered.subscribeOnDeferred()
        deffered.subscribeOnDeferred()
        observables_Challenge1.subscribe_Observables_Challenge1()
        observables_Challenge2.subscribe_Observables_Challenge2()
    }
    
    private func run_Subject_Examples(){
        puclishSubject.subscribeOn_Publish_Subject()
        behavior_Subject.subscribeOn_Publish_Subject()
        replay_Subject.subscribeOn_Replay_Subject()
    }
    
    private func run_Filtering_Operator(){
        filtering_Operator.exampleOn_Filtering_Opertaor()
    }

}

