//
//  PrayerViewController.swift
//  Compassion
//
//  Created by Geecon System Ltd. on 19/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class PrayerViewController: UIViewController {

    @IBOutlet weak var prayer_obj: UIButton!
    @IBOutlet weak var poverty_obj: UIButton!
    @IBOutlet weak var scroll_me: UIScrollView!
    @IBOutlet weak var line_2: UILabel!
    
    @IBOutlet weak var pagecontroller: UIPageControl!
    @IBOutlet weak var line_1: UILabel!
    
    
    var selectedimage = [UIImage(named:"short-note"),UIImage(named:"card")]
    var unselectedimage = [UIImage(named:"short-note1"),UIImage(named:"card1")]
    var titles = ["",""]
    var m_cMainPagecontaineVC : CUIMainPagecontaineVC!
    var m_cMyLifePageVC       : ViewController!
    
    func Intitialize(cMainPagecontaineVC : CUIMainPagecontaineVC)
    {
        self.m_cMainPagecontaineVC = cMainPagecontaineVC
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let slides = createSlides()
//        setupSlideScrollView(slides: slides)
//        pagecontroller.numberOfPages = slides.count
//        pagecontroller.currentPage = 0
//        line_2.isHidden = true
//        self.scroll_me.contentSize = CGSize(width:750, height: 02)

    }
    
//    func createSlides() -> [UIView] {
//        
//        let slide1:Prayer = Bundle.main.loadNibNamed("Prayer", owner: self, options: nil)?.first as! Prayer
//        
//        let slide2:ChildernPoverty = Bundle.main.loadNibNamed("ChildernPoverty", owner: self, options: nil)?.first as! ChildernPoverty
//        
//        return [slide1,slide2]
//    }

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
        pagecontroller.currentPage = Int(pageIndex)
        if pagecontroller.currentPage == 0 {
            prayer_obj.setImage(selectedimage[0], for: .normal)
            poverty_obj.setImage(unselectedimage[1], for: .normal)
            UIView.animate(withDuration: 1, animations: {
                self.line_1.isHidden = false
                self.line_2.isHidden = true
            }, completion: nil)
        } else {
            prayer_obj.setImage(unselectedimage[0], for: .normal)
            poverty_obj.setImage(selectedimage[1], for: .normal)
            UIView.animate(withDuration: 1, animations: {
                self.line_1.isHidden = true
                self.line_2.isHidden = false
            }, completion: nil)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func prayer_act(_ sender: Any) {
        var frame: CGRect = scroll_me.frame
        frame.origin.x = frame.size.width * 0
        frame.origin.y = 0
        scroll_me.scrollRectToVisible(frame, animated: true)
        pagecontroller.currentPage = 0
    }
    
    @IBAction func poverty(_ sender: Any) {
        var frame: CGRect = scroll_me.frame
        frame.origin.x = frame.size.width * 1
        frame.origin.y = 0
        scroll_me.scrollRectToVisible(frame, animated: true)
        pagecontroller.currentPage = 1
    }
}
