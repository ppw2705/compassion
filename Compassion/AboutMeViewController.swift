//
//  AboutMeViewController.swift
//  Compassion
//
//  Created by Grevin on 28/07/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit


class AboutMeViewController: UIViewController, UIScrollViewDelegate {

   
    @IBOutlet weak var MyLifeView: UILabel!
    @IBOutlet weak var MyphotosView: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var MyLifeBtn: UIButton!
    @IBOutlet weak var MyPhotosBtn: UIButton!
    @IBOutlet weak var scroll_me: UIScrollView!
    @IBOutlet weak var backward_btn: UIButton!
    @IBOutlet weak var forward_btn: UIButton!
    
    @IBOutlet weak var titleLbl: UILabel!
    var selectedimage = [UIImage(named:"my-family.png"),UIImage(named:"photo.png")]
    var unselectedimage = [UIImage(named:"my-family1.png"),UIImage(named:"photo1.png")]
    var titles = ["My Life + Family","My Photos"]
    
    var m_cLifeSlide : MyLife!;
    var m_cPhotosSlide : MyPhotos!;
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

        scrollView.delegate = self
        let slides = createSlides()
        setupSlideScrollView(slides: slides)
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        MyphotosView.isHidden = true
        MyPhotosBtn.isHighlighted = false
        MyLifeBtn.isHighlighted = false
        MyPhotosBtn.isSelected = false
        MyLifeBtn.isSelected = false
        //view.bringSubview(toFront: pageControl)
        self.scroll_me.contentSize = CGSize(width:750, height: 02)
        let fullNameArr = childName[0].characters.split{$0 == " "}.map(String.init)
        titleLbl.text = "About " + fullNameArr[0]
        m_cLifeSlide.childName.text = childName[0]
        let url = NSURL(string:childImg[0])
        let data = NSData(contentsOf:url! as URL)
        if data != nil {
            m_cLifeSlide.childImg.image = UIImage(data:data! as Data)
        }
        
    }
    
    func createSlides() -> [UIView] {
        let slide1:MyLife =  Bundle.main.loadNibNamed("MyLife", owner: self, options: nil)?.first as! MyLife
        
        m_cLifeSlide = slide1
        
        let slide2:MyPhotos = Bundle.main.loadNibNamed("MyPhotos", owner: self, options: nil)?.first as! MyPhotos
        
         m_cPhotosSlide = slide2

        return [slide1,slide2]
    }
    
    func setupSlideScrollView(slides:[UIView]) {
        scrollView.frame = CGRect(x:scrollView.frame.origin.x, y:scrollView.frame.origin.y, width: scrollView.frame.width, height: scrollView.frame.height)
        scrollView.contentSize = CGSize(width: scrollView.frame.width * CGFloat(slides.count), height: scrollView.frame.height )
        scrollView.isPagingEnabled = true
        var count = 0
        for i in slides {

            i.frame = CGRect(x:scrollView.frame.width * CGFloat(count), y: 0, width: scrollView.frame.width,height: i.frame.height)
            scrollView.addSubview(i)
            count += 1
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        if pageControl.currentPage == 0 {
            MyLifeBtn.setImage(selectedimage[0], for: .normal)
            MyPhotosBtn.setImage(unselectedimage[1], for: .normal)
            UIView.animate(withDuration: 1, animations: {
                self.MyLifeView.isHidden = false
                self.MyphotosView.isHidden = true
            }, completion: nil)
        } else {
            MyLifeBtn.setImage(unselectedimage[0], for: .normal)
            MyPhotosBtn.setImage(selectedimage[1], for: .normal)
            UIView.animate(withDuration: 1, animations: {
                self.MyLifeView.isHidden = true
                self.MyphotosView.isHidden = false
            }, completion: nil)

        }
    }

    @IBAction func MylifeAct(_ sender: Any) {
        MyPhotosBtn.isHighlighted = false
        MyLifeBtn.isHighlighted = false
        MyPhotosBtn.isSelected = false
        MyLifeBtn.isSelected = false
        var frame: CGRect = scrollView.frame
        frame.origin.x = frame.size.width * 0
        frame.origin.y = 0
        scrollView.scrollRectToVisible(frame, animated: true)
        pageControl.currentPage = 0

        MyLifeBtn.setImage(selectedimage[0], for: .normal)
        MyPhotosBtn.setImage(unselectedimage[1], for: .normal)
    }
    
    @IBAction func MyPhotosAct(_ sender: Any) {
        MyPhotosBtn.isHighlighted = false
        MyLifeBtn.isHighlighted = false
        MyPhotosBtn.isSelected = false
        MyLifeBtn.isSelected = false
        var frame: CGRect = scrollView.frame
        frame.origin.x = frame.size.width * 1
        frame.origin.y = 0
        scrollView.scrollRectToVisible(frame, animated: true)
        pageControl.currentPage = 1
        MyLifeBtn.setImage(unselectedimage[0], for: .normal)
        MyPhotosBtn.setImage(selectedimage[1], for: .normal)
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
        
        scrollView!.layer.add(transition, forKey: kCATransition)
        let fullNameArr = childName[currentChild].characters.split{$0 == " "}.map(String.init)
        titleLbl.text = "About " + fullNameArr[0]
        m_cLifeSlide.childName.text = childName[currentChild]
        let url = NSURL(string:childImg[currentChild])
        let data = NSData(contentsOf:url! as URL)
        if data != nil {
            m_cLifeSlide.childImg.image = UIImage(data:data! as Data)
        }

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
