//
//  CUIMainPagecontaineVC.swift
//  Compassion
//
//  Created by Grevin on 05/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class CUIMainPagecontaineVC: UIViewController {

    @IBOutlet weak var m_cContainerView : UIView!
    @IBOutlet weak var m_cMenuBar       : UIView!
    @IBOutlet weak var menu_iconobj: UIButton!
    @IBOutlet weak var menu_views: UIView!
    @IBOutlet weak var blur_views: UIView!
    @IBOutlet weak var m_cHomeBtn: UIButton!
    @IBOutlet weak var m_cAboutBtn: UIButton!
    @IBOutlet weak var m_cMyProjectBtn: UIButton!
    @IBOutlet weak var m_cMyProjectLbl: UILabel!
    
    @IBOutlet weak var m_cMyCommunityBtn: UIButton!
    @IBOutlet weak var m_cMyCommunityLbl: UILabel!
    @IBOutlet weak var m_cHomeLbl: UILabel!
    @IBOutlet weak var m_cAboutLbl: UILabel!
    
    
    var m_cCurrentVC        : UIViewController!
    var m_cHomePageVC       : ViewController!
    var m_cAboutmeVC        : AboutMeViewController!
    var m_cMyCommunityVC    : MyCommunityVC!
    var m_cMyprojectVC      : MyProjectController!
    
    var m_cReadletters      : CorrespondanceController!
    var m_cWriteletters     : WriteLetterController!


    
    var isalreadyClicked = false as Bool;
    
    
    override func awakeFromNib()
    {
        //Home Page VC
        self.m_cHomePageVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.m_cHomePageVC.Intitialize(cMainPagecontaineVC: self)
        
        //About Me VC
        self.m_cAboutmeVC = self.storyboard?.instantiateViewController(withIdentifier: "AboutMeViewController") as! AboutMeViewController
        self.m_cAboutmeVC.Intitialize(cMainPagecontaineVC: self)
        
        //My Community VC
        self.m_cMyCommunityVC = self.storyboard?.instantiateViewController(withIdentifier: "MyCommunityVC") as! MyCommunityVC
        self.m_cMyCommunityVC.Intitialize(cMainPagecontaineVC: self)
        
        //My Project VC
        self.m_cMyprojectVC = self.storyboard?.instantiateViewController(withIdentifier: "m_cMyprojectVC") as! MyProjectController
        self.m_cMyprojectVC.Intitialize(cMainPagecontaineVC: self)
        
        self.m_cReadletters = self.storyboard?.instantiateViewController(withIdentifier: "m_cReadletters") as! CorrespondanceController
        self.m_cReadletters.Intitialize(cMainPagecontaineVC: self)
        
        self.m_cWriteletters = self.storyboard?.instantiateViewController(withIdentifier: "m_cWriteletters") as! WriteLetterController
        self.m_cWriteletters.Intitialize(cMainPagecontaineVC: self)



        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        isalreadyClicked = true
        menu_views.isHidden=true
        blur_views.isHidden=true
        ShowHomePageVC()
       
    }
    
    @IBAction func onHomeBtnClicked(_ sender: Any)
    {
        self.ShowHomePageVC()
    }
    
    @IBAction func onAboutMeBtnClicked(_ sender: Any)
    {
            self.ShowAboutMeVC()
    }
    
    @IBAction func onMyCommunityBtnClicked(_ sender: Any)
    {
        self.ShowMyCommunityVC()
    }
    
    @IBAction func onMyprojectBtnClicked(_ sender: Any) {
        
        self.ShowMyProjectVC()

    }
    
    
    @IBAction func rEadletters(_ sender: Any) {
        
        self.ShowReadlettersC()
    }
    
    
    
    
    
    
    

    
    func ShowHomePageVC()
    {
        if (self.m_cCurrentVC != nil) && (self.m_cCurrentVC != m_cHomePageVC)
        {
            self.m_cCurrentVC.view.removeFromSuperview()
            self.m_cCurrentVC.removeFromParentViewController()

        }
        
        self.m_cHomePageVC.view.frame = self.m_cContainerView.bounds
        self.m_cContainerView.addSubview(self.m_cHomePageVC.view)
        self.m_cHomePageVC.didMove(toParentViewController: self)
        self.m_cHomePageVC.view.clipsToBounds = true
        self.m_cCurrentVC = self.m_cHomePageVC
        
        self.m_cHomeBtn.setImage(UIImage(named:"home1"), for: .normal)
        self.m_cAboutBtn.setImage(UIImage(named:"about-me"), for: .normal)
        self.m_cMyCommunityBtn.setImage(UIImage(named:"community"), for: .normal)
        self.m_cMyProjectBtn.setImage(UIImage(named:"my-project"), for: .normal)
        self.m_cMyProjectLbl.textColor = UIColor.lightGray
        self.m_cHomeLbl.textColor = UIColor.black
        self.m_cAboutLbl.textColor = UIColor.lightGray
        self.m_cMyCommunityLbl.textColor = UIColor.lightGray
    }
    
    func ShowAboutMeVC()
    {
        if (self.m_cCurrentVC != nil) && (self.m_cCurrentVC != m_cAboutmeVC)
        {
            
            self.m_cCurrentVC = m_cAboutmeVC
            
        }
        
        self.m_cAboutmeVC.view.frame = self.m_cContainerView.bounds
        self.m_cContainerView.addSubview(self.m_cAboutmeVC.view)
        self.m_cAboutmeVC.didMove(toParentViewController: self)
        self.m_cAboutmeVC.view.clipsToBounds = true
        self.m_cCurrentVC = self.m_cAboutmeVC
        self.m_cHomeBtn.setImage(UIImage(named:"home"), for: .normal)
        self.m_cAboutBtn.setImage(UIImage(named:"about-me1"), for: .normal)
        self.m_cMyCommunityBtn.setImage(UIImage(named:"community"), for: .normal)
        self.m_cMyProjectBtn.setImage(UIImage(named:"my-project"), for: .normal)
        self.m_cMyProjectLbl.textColor = UIColor.lightGray
        self.m_cHomeLbl.textColor = UIColor.lightGray
        self.m_cAboutLbl.textColor = UIColor.black
        self.m_cMyCommunityLbl.textColor = UIColor.lightGray
        
    }
    
    func ShowMyCommunityVC()
    {
        if (self.m_cCurrentVC != nil) && (self.m_cCurrentVC != m_cMyCommunityVC)
        {
            
            self.m_cCurrentVC = m_cMyCommunityVC
            
        }
        
        self.m_cMyCommunityVC.view.frame = self.m_cContainerView.bounds
        self.m_cContainerView.addSubview(self.m_cMyCommunityVC.view)
        self.m_cMyCommunityVC.didMove(toParentViewController: self)
        self.m_cMyCommunityVC.view.clipsToBounds = true
        self.m_cCurrentVC = self.m_cMyCommunityVC
        self.m_cHomeBtn.setImage(UIImage(named:"home"), for: .normal)
        self.m_cAboutBtn.setImage(UIImage(named:"about-me"), for: .normal)
        self.m_cMyCommunityBtn.setImage(UIImage(named:"community1"), for: .normal)
        self.m_cMyProjectBtn.setImage(UIImage(named:"my-project"), for: .normal)
        self.m_cMyProjectLbl.textColor = UIColor.lightGray
        self.m_cHomeLbl.textColor = UIColor.lightGray
        self.m_cAboutLbl.textColor = UIColor.lightGray
        self.m_cMyCommunityLbl.textColor = UIColor.black
    }
    
    
    
    func ShowMyProjectVC()
    {
        if (self.m_cCurrentVC != nil) && (self.m_cCurrentVC != m_cMyprojectVC)
        {
            
            self.m_cCurrentVC = m_cMyprojectVC
            
        }
        self.m_cMyprojectVC.view.frame = self.m_cContainerView.bounds
        self.m_cContainerView.addSubview(self.m_cMyprojectVC.view)
        self.m_cMyprojectVC.didMove(toParentViewController: self)
        self.m_cMyprojectVC.view.clipsToBounds = true
        self.m_cCurrentVC = self.m_cMyprojectVC
        self.m_cHomeBtn.setImage(UIImage(named:"home"), for: .normal)
        self.m_cAboutBtn.setImage(UIImage(named:"about-me"), for: .normal)
        self.m_cMyCommunityBtn.setImage(UIImage(named:"community"), for: .normal)
        self.m_cMyProjectBtn.setImage(UIImage(named:"my-project1"), for: .normal)
        self.m_cMyProjectLbl.textColor = UIColor.black
        self.m_cHomeLbl.textColor = UIColor.lightGray
        self.m_cAboutLbl.textColor = UIColor.lightGray
        self.m_cMyCommunityLbl.textColor = UIColor.lightGray
    }

    
    
    
    func ShowReadlettersC()
    {
        self.m_cHomeBtn.setImage(UIImage(named:"home"), for: .normal)
        self.m_cAboutBtn.setImage(UIImage(named:"about-me"), for: .normal)
        self.m_cMyCommunityBtn.setImage(UIImage(named:"community"), for: .normal)
        self.m_cMyProjectBtn.setImage(UIImage(named:"my-project"), for: .normal)
        self.m_cMyProjectLbl.textColor = UIColor.lightGray
        self.m_cHomeLbl.textColor = UIColor.lightGray
        self.m_cAboutLbl.textColor = UIColor.lightGray
        self.m_cMyCommunityLbl.textColor = UIColor.lightGray
            menu_iconobj.setImage(UIImage(named: "middle-button"), for: .normal)
            menu_views.isHidden = true
            blur_views.isHidden = true
            isalreadyClicked = true
        
        if (self.m_cCurrentVC != nil) && (self.m_cCurrentVC != m_cReadletters)
        {
            
            self.m_cCurrentVC = m_cReadletters
            
        }
        self.m_cReadletters.view.frame = self.m_cContainerView.bounds
        self.m_cContainerView.addSubview(self.m_cReadletters.view)
        self.m_cReadletters.didMove(toParentViewController: self)
        self.m_cReadletters.view.clipsToBounds = true
        self.m_cCurrentVC = self.m_cReadletters
        
    }

    func ShowWritelettersC()
    {
        self.m_cHomeBtn.setImage(UIImage(named:"home"), for: .normal)
        self.m_cAboutBtn.setImage(UIImage(named:"about-me"), for: .normal)
        self.m_cMyCommunityBtn.setImage(UIImage(named:"community"), for: .normal)
        self.m_cMyProjectBtn.setImage(UIImage(named:"my-project"), for: .normal)
        self.m_cMyProjectLbl.textColor = UIColor.lightGray
        self.m_cHomeLbl.textColor = UIColor.lightGray
        self.m_cAboutLbl.textColor = UIColor.lightGray
        self.m_cMyCommunityLbl.textColor = UIColor.lightGray
        menu_iconobj.setImage(UIImage(named: "middle-button"), for: .normal)
        menu_views.isHidden = true
        blur_views.isHidden = true
        isalreadyClicked = true
        
        if (self.m_cCurrentVC != nil) && (self.m_cCurrentVC != m_cWriteletters)
        {
            
            self.m_cCurrentVC = m_cWriteletters
            
        }
        self.m_cWriteletters.view.frame = self.m_cContainerView.bounds
        self.m_cContainerView.addSubview(self.m_cWriteletters.view)
        self.m_cWriteletters.didMove(toParentViewController: self)
        self.m_cWriteletters.view.clipsToBounds = true
        self.m_cCurrentVC = self.m_cWriteletters
        
    }

    
    
    
    
    @IBAction func menu_iconact(_ sender: UIButton) {
        menu_iconobj.isSelected = !menu_iconobj.isSelected
        if isalreadyClicked {
            menu_iconobj.setImage(UIImage(named: "middle-button1"), for: .normal)
            menu_views.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {() -> Void in
                self.menu_views.transform = CGAffineTransform.identity
                self.menu_views.isHidden = false
            }, completion: {(_ finished: Bool) -> Void in
            })
            blur_views.isHidden = false
            isalreadyClicked = false
        }
        else {
            menu_iconobj.setImage(UIImage(named: "middle-button"), for: .normal)
            menu_views.isHidden = true
            blur_views.isHidden = true
            isalreadyClicked = true
        }
        
    }
    
    @IBAction func write_message(_ sender: Any) {
        
        self.ShowWritelettersC()
    }
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
      
    }
    

   
}
