//
//  GiftWalletViewController.swift
//  CUKswift
//
//  Created by Geecon System Ltd. on 01/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class GiftWalletViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var view_1: UIView!
    @IBOutlet weak var view_2: UIView!
    @IBOutlet weak var view_button1: UIView!
    @IBOutlet weak var view_button2: UIView!
    @IBOutlet weak var view_button3: UIView!
    @IBOutlet weak var money_tble: UITableView!
    
    var  name_array = ["Gift (Mahamadi)", "Gift (Mahamadi)", "Donation"]
    var  type_array = ["Birthday", "Family", "General"]
    var  amount_array = ["25", "15", "15"]

    let cellReuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view_button1.layer.cornerRadius = 20
        self.view_button1.layer.masksToBounds = true
        
        self.view_button2.layer.cornerRadius = 20
        self.view_button2.layer.masksToBounds = true

        self.view_button3.layer.cornerRadius = 20
        self.view_button3.layer.masksToBounds = true

        let path = UIBezierPath(roundedRect:self.view_2.bounds,
                                byRoundingCorners:[.bottomRight, .bottomLeft],
                                cornerRadii: CGSize(width: 07, height:  07))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.view_2.layer.mask = maskLayer

        let path1 = UIBezierPath(roundedRect:self.view_1.bounds,
                                byRoundingCorners:[.topLeft, .topRight],
                                cornerRadii: CGSize(width: 07, height:  07))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.path = path1.cgPath
        self.view_1.layer.mask = maskLayer1

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:GiftWalletTableViewCell = self.money_tble.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! GiftWalletTableViewCell
        
        cell.name_lbl.text = self.name_array[indexPath.row]
        cell.type_lbl.text = self.type_array[indexPath.row]
        cell.amount_lbl.text = self.amount_array[indexPath.row]

        
        return cell
        
    }
}
