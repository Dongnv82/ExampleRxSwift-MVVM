//
//  VMExampleOne.swift
//  ExampleRxSwift-MVVM
//
//  Created by MT382 on 12/4/19.
//  Copyright © 2019 DongNV. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class VMExampleOne {
    //Mark: - properties
    //Step 1: quan sát bên ViewController (VC) có bao nhiêu thành phần input rồi qua bên ViewModel (VM) khai báo bấy nhiêu Variable, hoặc PublishSubject
    var inputText = Variable<String>("")
    
    
    //Step 3: VM sau khi nhận được tín hiệu để xử lý data đó theo requirement rồi send back data đến VC bằng cách phát ra các Observable tương ứng
    var textObservable: Observable<String> {
        return inputText.asObservable()
    }
}
