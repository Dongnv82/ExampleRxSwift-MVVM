//
//  VMExThree.swift
//  ExampleRxSwift-MVVM
//
//  Created by MT382 on 12/4/19.
//  Copyright © 2019 DongNV. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class VMExThree {
    //Step 1
    var emailInput = Variable<String>("")
    var passInput = Variable<String>("")
    
    //Step 3:
    var isChecked: Observable<Bool> {
        return Observable.combineLatest(emailInput.asObservable(),passInput.asObservable()) {
            emai,pass in
            return emai.isValidEmail() && pass.count >= 8
        }
    }
}
