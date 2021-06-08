//
//  registerVC.swift
//  demoSQLite
//
//  Created by EDITOR  on 10/02/21.
//  Copyright © 2021 haris. All rights reserved.
//

import UIKit

class registerVC: UIViewController {

    @IBOutlet weak var lblName: UITextField!
    @IBOutlet weak var lblEmail: UITextField!
    @IBOutlet weak var lblpassword: UITextField!
    let button = UIButton(type: .custom)
    
    let db = Databasehandler()
    override func viewDidLoad() {
        super.viewDidLoad()//--------- inicio de imagen que oculta pass-------
        button.setImage(UIImage(named: "eyeA.png"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 5, left: -24, bottom: 5, right: 15)
        button.frame = CGRect(x: CGFloat(lblpassword.frame.size.width-25), y: CGFloat(5), width: CGFloat(15), height: CGFloat(25))
        button.addTarget(self, action: #selector(self.btnPass), for: .touchUpInside)
        lblpassword.rightView = button
        lblpassword.rightViewMode = .always
    }
    
    @IBAction func btnPass(_ sender: Any){
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if (sender as! UIButton).isSelected {
            self.lblpassword.isSecureTextEntry = false
            button.setImage(UIImage(named: "eyeC.png"), for: .normal)
        }else{
            self.lblpassword.isSecureTextEntry = true
            button.setImage(UIImage(named: "eyeA.png"), for: .normal)
        }
    }
    //---------fin imagen que oculta pass-------
    
    @IBAction func registerClick(_ sender: Any) {
        if lblEmail.text! != "" && lblpassword.text! != ""{
            let q = "insert into logindata(name,email,password) values ('"+lblName.text!+"' , '"+lblEmail.text!+"' , '"+lblpassword.text!+"')"
            let result = db.executeQuery(query: q)
            
            if result{
                self.performSegue(withIdentifier: "loginPage", sender: self)
            }
            else{
                //print("Data not Added")
                let alert: UIAlertView = UIAlertView(title: "Alerta", message: "Usuario ya regstrado", delegate: self, cancelButtonTitle: "OK")
                alert.show()
            }
        }
        else{
            //Te faltan campos por llenar
            let alert: UIAlertView = UIAlertView(title: "Alerta", message: "Te faltan campos por llenar", delegate: self, cancelButtonTitle: "Aceptar")
            alert.show()
        }
    }
}
