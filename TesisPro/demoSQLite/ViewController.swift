//
//  ViewController.swift
//  demoSQLite
//
//  Created by EDITOR  on 10/02/21.
//  Copyright © 2021 haris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let db = Databasehandler()

    @IBOutlet weak var lblemail: UITextField!
    @IBOutlet weak var lblpassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func loginClicked(_ sender: Any) {
        print("-------------")
        print("Correo login: "+lblemail.text!)
        print("Contraseña login: "+lblpassword.text!)
        print("-------------")
        let ans = db.loginAuthentication(email: lblemail.text!, password: lblpassword.text!)
        if ans{
            let data = db.executeSelect(email: lblemail.text!, password: lblpassword.text!)
            print("Nombre: "+data.name)
            print("Correo: "+data.email)
            print("Contraseña: "+data.password)
            print("-------------")
            
            self.performSegue(withIdentifier: "helloPage", sender: self)
        }
        else{
            print("Datos incorrectos.")
            let alert: UIAlertView = UIAlertView(title: "Alerta", message: "Datos incorrectos", delegate: self, cancelButtonTitle: "Aceptar")
            alert.show()
        }
    }
    
}

