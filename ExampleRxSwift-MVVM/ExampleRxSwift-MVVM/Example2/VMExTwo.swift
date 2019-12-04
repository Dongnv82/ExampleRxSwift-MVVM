//
//  VMExTwo.swift
//  ExampleRxSwift-MVVM
//
//  Created by MT382 on 12/4/19.
//  Copyright © 2019 DongNV. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class VMExTwo {
    //Step 1:Tạo biền hứng các hành động bên VC
    //Mark: -properties
    var inputText1 = Variable<String>("")
    var inputText2 = Variable<String>("")
    
    //Step 3: nhận dữ liệu từ VC truyền sang và xử lý
    var outputView: Observable<String> {
        return Observable.combineLatest(inputText1.asObservable(),inputText2.asObservable()) {
            input1,input2 in
            if (input1 == "" && input2 == "") {
                return "Hello EveryOne"
            } else {
                return input1 + " " + input2
            }
        }
    }
}
