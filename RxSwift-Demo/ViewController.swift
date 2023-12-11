//
//  ViewController.swift
//  RxSwift-Demo
//
//  Created by 3rabApp-oday on 11/12/2023.
//

import UIKit

class ViewController: UIViewController {

    
    let just        = Just()
    let of          = OF()
    let from        = From()
    let empty       = Empty()
    let never       = Never()
    let range       = Range()
    let create      = Create()
    let deffered    = Deferred()
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    }


}

