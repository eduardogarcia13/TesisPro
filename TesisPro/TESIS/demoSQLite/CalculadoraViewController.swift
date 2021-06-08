//
//  CalculadoraViewController.swift
//  demoSQLite
//
//  Created by EDITOR  on 01/06/21.
//  Copyright © 2021 haris. All rights reserved.
//

import UIKit

class CalculadoraViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func calcu(_ sender: Any) {
        let alert: UIAlertView = UIAlertView(title: "Tu IMC es: 19.6", message: "Su rango de peso saludable sugerido es de 62 a 83 kg.", delegate: self, cancelButtonTitle: "OK")
        alert.show()
    }
    
}
