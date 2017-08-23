//
//  MyProjectController.swift
//  Compassion
//
//  Created by Geecon System Ltd. on 10/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class MyProjectController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var top_menu: UIView!
    @IBOutlet weak var about_obj: UIButton!
    @IBOutlet weak var whatlrng_obj: UIButton!
    @IBOutlet weak var view_1: UILabel!
    @IBOutlet weak var view_2: UILabel!
    @IBOutlet weak var scroll_me: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var about_lbl: UILabel!
    @IBOutlet weak var learning_lbl: UILabel!
    var m_cAboutSlide : About!
    var m_cLearnSlide : whatlearn!
    var selectedimage = [UIImage(named:"1-11"),UIImage(named:"2.1")]
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var backward_btn: UIButton!
    @IBOutlet weak var forward_btn: UIButton!
    var unselectedimage = [UIImage(named:"1.1-3"),UIImage(named:"2-11")]
    var titles = ["",""]
    
    var currentChild = 0
    var previousChild = -1
    var childName = ["Yaneth Lucero Huarca Cordova","Dawry David De Los Santos","Fedson Jean Baptiste","Iker Matias Rincones Balderramo","Yarith Paola Vargas Iriarte"]
    var childImg = ["https://media.ci.org/w_230,h_230,c_thumb,g_face/ChildPhotos/Published/04886112_889074.jpg","https://media.ci.org/w_230,h_230,c_thumb,g_face/v1495045051/ChildPhotos/Published/06158334_3c78a7.jpg","https://www.compassionuk.org/childimages/headshot/HA021901139.jpg","https://www.compassionuk.org/childimages/headshot/EC057200135.jpg","https://www.compassionuk.org/childimages/headshot/CO054400021.jpg"]

    var m_cMainPagecontaineVC : CUIMainPagecontaineVC!
    var m_cMyLifePageVC       : ViewController!
    func Intitialize(cMainPagecontaineVC : CUIMainPagecontaineVC)
    {
        self.m_cMainPagecontaineVC = cMainPagecontaineVC
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scroll_me.delegate = self
        let slides = createSlides()
        setupSlideScrollView(slides: slides)
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view_2.isHidden = true
        
        self.scroll_me.contentSize = CGSize(width:750, height: 02)
        let fullNameArr = childName[0].characters.split{$0 == " "}.map(String.init)
        titleLbl.text = fullNameArr[0] + "'s Project"
        m_cAboutSlide.childName.text = childName[0]
        m_cAboutSlide.childImg.sd_setImage(with: URL(string: childImg[currentChild]), placeholderImage: UIImage(named: "child4.png"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


    @IBAction func about_act(_ sender: Any) {
        
        var frame: CGRect = scroll_me.frame
        frame.origin.x = frame.size.width * 0
        frame.origin.y = 0
        scroll_me.scrollRectToVisible(frame, animated: true)
        pageControl.currentPage = 0
    }
    
    @IBAction func what_act(_ sender: Any) {
        
        var frame: CGRect = scroll_me.frame
        frame.origin.x = frame.size.width * 1
        frame.origin.y = 0
        scroll_me.scrollRectToVisible(frame, animated: true)
        pageControl.currentPage = 1
    }
    
    func createSlides() -> [UIView] {
        
        let slide1:About = Bundle.main.loadNibNamed("About", owner: self, options: nil)?.first as! About
        
        m_cAboutSlide = slide1
        
        let slide2:whatlearn = Bundle.main.loadNibNamed("Whatlearn", owner: self, options: nil)?.first as! whatlearn
        
        m_cLearnSlide = slide2
        
        return [slide1,slide2]
    }
    
    func setupSlideScrollView(slides:[UIView]) {
        scroll_me.frame = CGRect(x:scroll_me.frame.origin.x, y:scroll_me.frame.origin.y, width: scroll_me.frame.width, height: scroll_me.frame.height)
        scroll_me.contentSize = CGSize(width: scroll_me.frame.width * CGFloat(slides.count), height: scroll_me.frame.height )
        scroll_me.isPagingEnabled = true
        var count = 0
        for i in slides {
            
            i.frame = CGRect(x:scroll_me.frame.width * CGFloat(count), y: 0, width: scroll_me.frame.width,height: i.frame.height)
            scroll_me.addSubview(i)
            count += 1
        }
        
    }

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        if pageControl.currentPage == 0 {
            about_obj.setImage(selectedimage[0], for: .normal)
            whatlrng_obj.setImage(unselectedimage[1], for: .normal)
            UIView.animate(withDuration: 1, animations: {
                self.view_1.isHidden = false
                self.view_2.isHidden = true
            }, completion: nil)
        } else {
            about_obj.setImage(unselectedimage[0], for: .normal)
            whatlrng_obj.setImage(selectedimage[1], for: .normal)
            UIView.animate(withDuration: 1, animations: {
                self.view_1.isHidden = true
                self.view_2.isHidden = false
            }, completion: nil)
            
        }
        
        
        if scroll_me.contentOffset.y > 100 {
            UIView.animate(withDuration: 0.5, animations: {() -> Void in
                self.top_menu.transform = CGAffineTransform(translationX: 0, y: -70)
            })
        }
        else {
            UIView.animate(withDuration: 0.5, animations: {() -> Void in
                self.top_menu.transform = CGAffineTransform(translationX: 0, y: 0)
            })
        }
    }
    
    @IBAction func act(_ sender: UIButton) {
        
        var forward = false
        if sender.tag == 10 {
            if currentChild == 0 {
                currentChild = childName.count - 1
            } else {
                currentChild -= 1
            }
            forward = false
        }
        
        if sender.tag == 11 {
            if currentChild == childName.count - 1 {
                currentChild = 0
            } else {
                currentChild += 1
            }
            forward = true
        }
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        if forward {
            transition.subtype = kCATransitionFromRight
        } else {
            transition.subtype = kCATransitionFromLeft
        }
        
        scroll_me!.layer.add(transition, forKey: kCATransition)
        let fullNameArr = childName[currentChild].characters.split{$0 == " "}.map(String.init)
        titleLbl.text = fullNameArr[0] + "'s Project"
        m_cAboutSlide.childName.text = childName[currentChild]
        m_cAboutSlide.childImg.sd_setImage(with: URL(string: childImg[currentChild]), placeholderImage: UIImage(named: "child4.png"))
        
    }

    
}
