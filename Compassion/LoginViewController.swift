//
//  LoginViewController.swift
//  CUKswift
//
//  Created by Geecon System Ltd. on 27/07/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var view_1: UIView!
    @IBOutlet weak var view_2: UIView!
    @IBOutlet weak var user_nametext: UITextField!
    @IBOutlet weak var password_text: UITextField!
    @IBOutlet weak var view_3: UIView!
    @IBOutlet weak var view_4: UIView!
    @IBOutlet weak var show_passobj: UIButton!
    @IBOutlet weak var view_5: UIView!
    @IBOutlet weak var view_6: UIView!
    @IBOutlet weak var check_boxobj: UIButton!
    
    var iconClick : Bool!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        iconClick = true

        self.view_1.layer.cornerRadius = 20
        self.view_1.layer.masksToBounds = true
        
        
        self.view_5.layer.cornerRadius = 20
        self.view_5.layer.masksToBounds = true
        self.view_5.layer.borderWidth = 1
        self.view_5.layer.borderColor = UIColor.white.cgColor


        
        self.view_2.layer.cornerRadius = 20
        self.view_2.layer.masksToBounds = true
        
        self.view_6.layer.cornerRadius = 20
        self.view_6.layer.masksToBounds = true
        self.view_6.layer.borderWidth = 1
        self.view_6.layer.borderColor = UIColor.white.cgColor


        
        self.view_3.layer.cornerRadius = 20
        self.view_3.layer.masksToBounds = true
        
        self.view_4.layer.cornerRadius = 20
        self.view_4.layer.masksToBounds = true


        let color = UIColor.white
        self.user_nametext.attributedPlaceholder = NSAttributedString(string: self.user_nametext.placeholder!, attributes: [NSForegroundColorAttributeName : color])
        
        self.password_text.attributedPlaceholder = NSAttributedString(string: self.password_text.placeholder!, attributes: [NSForegroundColorAttributeName : color])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


    @IBAction func back(_ sender: Any) {
        
        self.dismiss(animated: false, completion: nil)
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        view.window!.layer.add(transition, forKey: kCATransition)

        
    }
    @IBAction func forget_act(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let MyLifeCon = storyBoard.instantiateViewController(withIdentifier: "MyLifeController") as! MyLifeController
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        view.window!.layer.add(transition, forKey: kCATransition)
        self.present(MyLifeCon, animated: false, completion: nil)

        
        
    }
    @IBAction func forget_name(_ sender: Any) {
        
        

        
    }
    
    @IBAction func show_passact(_ sender: Any) {
        

    }
    
    @IBAction func log_in(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainPage = storyBoard.instantiateViewController(withIdentifier: "CUIMainPagecontaineVC") as! CUIMainPagecontaineVC
        
//        let transition = CATransition()
//        transition.duration = 0.3
//        transition.type = kCATransitionPush
//        transition.subtype = kCATransitionFromRight
//        view.window!.layer.add(transition, forKey: kCATransition)
       self.present(mainPage, animated: false, completion: nil)

        
    }
    @IBAction func fb_signin(_ sender: Any) {
        
        

    }
    
    @IBAction func check_boxact(_ sender: Any) {
        
        if (self.check_boxobj.isSelected == true)
        {
            self.check_boxobj.setBackgroundImage(UIImage(named: "check-box"), for: UIControlState.normal)
            
            self.check_boxobj.isSelected = false;
        }
        else
        {
            self.check_boxobj.setBackgroundImage(UIImage(named: "check-box1-1"), for: UIControlState.normal)
            
            self.check_boxobj.isSelected = true;
        }

    }
}
