//
//  DetailVC.swift
//  SplitViewController
//
//  Created by Juan Morillo on 22/1/18.
//  Copyright © 2018 Juan Morillo. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    //IBOutlets y Propiedades
    @IBOutlet weak var portada: UIImageView!
    @IBOutlet weak var descripcionLabel: UILabel!
    @IBOutlet weak var nombreCiudadLabel: UILabel!
    
    //Variables
    var imagenCiudad   : UIImage?
    var descripcion    : String?
    var nombreCiudad   : String?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        nombreCiudadLabel.text = nombreCiudad
        portada.image = imagenCiudad
        descripcionLabel.text = descripcion
    }
    
}

