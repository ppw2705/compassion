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
    
    var selectedimage = [UIImage(named:"my-family.png"),UIImage(named:"photo.png")]
    var unselectedimage = [UIImage(named:"my-family1.png"),UIImage(named:"photo1.png")]
    var titles = ["My Life + Family","My Photos"]
    
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
        
    }
    
    func createSlides() -> [UIView] {
        let slide1:MyLife = Bundle.main.loadNibNamed("MyLife", owner: self, options: nil)?.first as! MyLife
        
        let slide2:MyPhotos = Bundle.main.loadNibNamed("MyPhotos", owner: self, options: nil)?.first as! MyPhotos

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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
