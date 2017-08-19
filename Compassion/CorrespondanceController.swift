//
//  CorrespondanceController.swift
//  Compassion
//
//  Created by Geecon System Ltd. on 16/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class CorrespondanceController: UIViewController {

    @IBOutlet weak var from_obj: UIButton!
    @IBOutlet weak var to_obj: UIButton!
    @IBOutlet weak var line_1: UILabel!
    @IBOutlet weak var line_2: UILabel!
    @IBOutlet weak var scroll_main: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!

    var selectedimage = [UIImage(named:"from1"),UIImage(named:"to1")]
    var unselectedimage = [UIImage(named:"from2"),UIImage(named:"to2")]
    var titles = ["",""]
    var m_cMainPagecontaineVC : CUIMainPagecontaineVC!
    var m_cMyLifePageVC       : ViewController!
    
    func Intitialize(cMainPagecontaineVC : CUIMainPagecontaineVC)
    {
        self.m_cMainPagecontaineVC = cMainPagecontaineVC
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let slides = createSlides()
        setupSlideScrollView(slides: slides)
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        line_2.isHidden = true
        
        self.scroll_main.contentSize = CGSize(width:750, height: 02)


    }
    func createSlides() -> [UIView] {
        
        let slide1:From = Bundle.main.loadNibNamed("From", owner: self, options: nil)?.first as! From
        
        let slide2:To = Bundle.main.loadNibNamed("To", owner: self, options: nil)?.first as! To
        
        return [slide1,slide2]
    }
    
    func setupSlideScrollView(slides:[UIView]) {
        scroll_main.frame = CGRect(x:scroll_main.frame.origin.x, y:scroll_main.frame.origin.y, width: scroll_main.frame.width, height: scroll_main.frame.height)
        scroll_main.contentSize = CGSize(width: scroll_main.frame.width * CGFloat(slides.count), height: scroll_main.frame.height )
        scroll_main.isPagingEnabled = true
        var count = 0
        for i in slides {
            
            i.frame = CGRect(x:scroll_main.frame.width * CGFloat(count), y: 0, width: scroll_main.frame.width,height: i.frame.height)
            scroll_main.addSubview(i)
            count += 1
        }
        
    }
    
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        if pageControl.currentPage == 0 {
            from_obj.setImage(selectedimage[0], for: .normal)
            to_obj.setImage(unselectedimage[1], for: .normal)
            UIView.animate(withDuration: 1, animations: {
                self.line_1.isHidden = false
                self.line_2.isHidden = true
            }, completion: nil)
        } else {
            from_obj.setImage(unselectedimage[0], for: .normal)
            to_obj.setImage(selectedimage[1], for: .normal)
            UIView.animate(withDuration: 1, animations: {
                self.line_1.isHidden = true
                self.line_2.isHidden = false
            }, completion: nil)
            
        }
    }
    
    @IBAction func from_act(_ sender: Any) {
        var frame: CGRect = scroll_main.frame
        frame.origin.x = frame.size.width * 0
        frame.origin.y = 0
        scroll_main.scrollRectToVisible(frame, animated: true)
        pageControl.currentPage = 0
    }
    
    @IBAction func to_act(_ sender: Any) {
        
        var frame: CGRect = scroll_main.frame
        frame.origin.x = frame.size.width * 1
        frame.origin.y = 0
        scroll_main.scrollRectToVisible(frame, animated: true)
        pageControl.currentPage = 1
    }

    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)

    }
}

