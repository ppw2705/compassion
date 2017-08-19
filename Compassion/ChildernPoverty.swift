//
//  ChildernPoverty.swift
//  Compassion
//
//  Created by Geecon System Ltd. on 19/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class ChildernPoverty: UIView, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var pover_blg: UITableView!
    
    var pointsprayer = ["30 jun 2017",
                        "2 jun 2017",
                        "12 jun 2017",
                        "23 jun 2017",
                        "16 jun 2017"]

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.pover_blg.delegate = self
        self.pover_blg.dataSource = self
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.pover_blg.dequeueReusableCell(withIdentifier: "PovertyTableViewCell", for: indexPath) as! PovertyTableViewCell;
        
        cell.day_date.text = pointsprayer[indexPath.row];
        
        return cell;
        
    }

}
