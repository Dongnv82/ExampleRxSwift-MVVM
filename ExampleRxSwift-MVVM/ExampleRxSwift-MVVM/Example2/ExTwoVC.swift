//
//  ExTwoVC.swift
//  ExampleRxSwift-MVVM
//
//  Created by MT382 on 12/4/19.
//  Copyright © 2019 DongNV. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ExTwoVC: UIViewController {
    
    //Mark: -IBOutlet
    @IBOutlet weak var outputText: UITextView!
    @IBOutlet weak var input1: UITextField!
    @IBOutlet weak var input2: UITextField!
    
    //Mark: -properties
    let viewModel = VMExTwo()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Step 2: truyền hành động,dữ liệu từ VC về VM
        input1.rx.text.map {$0 ?? ""}
        .bind(to: viewModel.inputText1)
        .disposed(by: disposeBag)
        
        input2.rx.text.map {$0 ?? ""}
        .bind(to: viewModel.inputText2)
        .disposed(by: disposeBag)
        
        //Step 4: truyền các dữ liệu đã xử lý từ VM sang hiển thị trên VC
        viewModel.outputView
        .bind(to: outputText.rx.text)
        .disposed(by: disposeBag)
    }

}
