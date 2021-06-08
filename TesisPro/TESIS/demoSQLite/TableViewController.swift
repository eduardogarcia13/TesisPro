//
//  TableViewController.swift
//  demoSQLite
//
//  Created by EDITOR  on 14/03/21.
//  Copyright © 2021 haris. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    let titlesF = [("Apple"),("Apricot"),("Banana"),("Grapes"),("Kiwi"),("Orange"),("Peach")]
    let imagesF = [UIImage(named: "eyeA"),
                   UIImage(named: "eyeC")]
     
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesF.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableView {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! UITableView
        cell.imgCell.image = self.imagesF[indexPath.row]
        cell.titlesF.text = self.titlesF[indexPath.row]
        return cell
    }
}
