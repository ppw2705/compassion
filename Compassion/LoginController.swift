//
//  LoginController.swift
//  CUKswift
//
//  Created by Geecon System Ltd. on 27/07/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var view_1: UIView!
    @IBOutlet weak var com_userobj: UIButton!
    @IBOutlet weak var view_2: UIView!
    @IBOutlet weak var comp_newobj: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.com_userobj?.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        self.comp_newobj?.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        
        self.com_userobj.titleLabel?.textAlignment = NSTextAlignment.center
        self.comp_newobj.titleLabel?.textAlignment = NSTextAlignment.center

        self.view_1.layer.cornerRadius = 20
        self.view_1.layer.masksToBounds = true
        
        self.view_2.layer.cornerRadius = 20
        self.view_2.layer.masksToBounds = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func comp_useract(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let LoginViewCont = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        view.window!.layer.add(transition, forKey: kCATransition)
        self.present(LoginViewCont, animated: false, completion: nil)

        
    }
    @IBAction func comp_newact(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let LoginViewCont = storyBoard.instantiateViewController(withIdentifier: "NotanuserController") as! NotanuserController
        
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        view.window!.layer.add(transition, forKey: kCATransition)
        self.present(LoginViewCont, animated: false, completion: nil)

        
    }
    
    
}

