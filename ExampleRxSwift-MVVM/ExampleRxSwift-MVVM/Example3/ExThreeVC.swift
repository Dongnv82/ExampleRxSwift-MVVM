//
//  ExThreeVC.swift
//  ExampleRxSwift-MVVM
//
//  Created by MT382 on 12/4/19.
//  Copyright © 2019 DongNV. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ExThreeVC: UIViewController {
    
    //Mark: -IBOutlet
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    //Mark: -Properties
    let viewModel = VMExThree()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Step 2:
        email.rx.text.map {$0 ?? ""}
        .bind(to: viewModel.emailInput)
        .disposed(by: disposeBag)
        
        password.rx.text.map {$0 ?? ""}
        .bind(to: viewModel.passInput)
        .disposed(by: disposeBag)
        
        //Step 4:
        viewModel.isChecked
        .bind(to: loginBtn.rx.isEnabled)
        .disposed(by: disposeBag)
        
        viewModel.isChecked.subscribe(onNext: {
            isChecked in
            self.status.text = isChecked ? "Availabel" : "Not Availabel"
            self.status.textColor = isChecked ? .green : .red
            self.loginBtn.setTitleColor(isChecked ? .blue : .gray, for: .normal)
        })
    }

}
