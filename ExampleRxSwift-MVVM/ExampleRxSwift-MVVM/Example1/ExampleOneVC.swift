//
//  ExampleOneVC.swift
//  ExampleRxSwift-MVVM
//
//  Created by MT382 on 12/4/19.
//  Copyright © 2019 DongNV. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ExampleOneVC: UIViewController {
    //Mark: -IBOutlet
    
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var label: UILabel!
    
    
    //Mark: -properties
    
    let viewModel = VMExampleOne()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Step 2: VM sẽ nhận tín hiệu, data của Input từ VC (như là hit button, edit textfield v..v)
        inputText.rx.text.map {$0 ?? ""}
        .bind(to: viewModel.inputText)
        .disposed(by: disposeBag)
        
        //Step 4: Output ở VC sẽ subscribe những Observable mà VM cung cấp
        viewModel.textObservable
        .bind(to: label.rx.text)
        .disposed(by: disposeBag)
        
    }
}
