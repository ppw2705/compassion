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
    var selectedimage = [UIImage(named:"1-11"),UIImage(named:"2.1")]
    
    var unselectedimage = [UIImage(named:"1.1-3"),UIImage(named:"2-11")]
    var titles = ["",""]

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
        about_obj.setImage(selectedimage[0], for: .normal)
        whatlrng_obj.setImage(unselectedimage[1], for: .normal)


    }
    @IBAction func what_act(_ sender: Any) {
        
        var frame: CGRect = scroll_me.frame
        frame.origin.x = frame.size.width * 1
        frame.origin.y = 0
        scroll_me.scrollRectToVisible(frame, animated: true)
        pageControl.currentPage = 1
        about_obj.setImage(unselectedimage[0], for: .normal)
        whatlrng_obj.setImage(selectedimage[1], for: .normal)

        

        
    }
    
    func createSlides() -> [UIView] {
        
        let slide1:About = Bundle.main.loadNibNamed("About", owner: self, options: nil)?.first as! About
        
        let slide2:whatlearn = Bundle.main.loadNibNamed("Whatlearn", owner: self, options: nil)?.first as! whatlearn
        
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

    
}
