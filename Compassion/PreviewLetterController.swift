//
//  PreviewLetterController.swift
//  Compassion
//
//  Created by Geecon System Ltd. on 19/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class PreviewLetterController: UIViewController {

    @IBOutlet weak var send_view: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.send_view.layer.cornerRadius = 18
        self.send_view.layer.masksToBounds = true


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)

    }
}
