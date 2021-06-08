//
//  MasterViewController.swift
//  SplitViewController
//
//  Created by Juan Morillo on 22/1/18.
//  Copyright © 2018 Juan Morillo. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let imagen = arrayImages[indexPath.row]
                let nombre = arrayNombres[indexPath.row]
                let description = arrayDescripcion[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailVC
                controller.imagenCiudad = imagen
                controller.descripcion = description
                controller.nombreCiudad = nombre
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    // MARK: - Table View
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayImages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel!.text = arrayNombres[indexPath.row]
        cell.backgroundColor = arrayColors[indexPath.row]
        return cell
    }
    
}

