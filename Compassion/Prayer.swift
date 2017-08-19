//
//  Prayer.swift
//  Compassion
//
//  Created by Geecon System Ltd. on 19/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class Prayer: UIView, UITableViewDataSource, UITableViewDelegate {
    
    var pointsprayer = ["30 jun 2017",
                 "2 jun 2017",
                 "12 jun 2017",
                 "23 jun 2017",
                 "16 jun 2017"]


    @IBOutlet weak var oiints_table: UITableView!
    override func layoutSubviews() {
        super.layoutSubviews()

        self.oiints_table.delegate = self
        self.oiints_table.dataSource = self
        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pointsprayer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.oiints_table.dequeueReusableCell(withIdentifier: "PointsTableViewCell", for: indexPath) as! PointsTableViewCell;
        cell.points.text = pointsprayer[indexPath.row];
        return cell;

    }
}
