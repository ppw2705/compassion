//
//  WriteLetterController.swift
//  Compassion
//
//  Created by Geecon System Ltd. on 17/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class WriteLetterController: UIViewController {

    @IBOutlet weak var from_obj: UIButton!
    @IBOutlet weak var to_ltrobj: UIButton!
    @IBOutlet weak var line_1act: UILabel!
    @IBOutlet weak var line_2act: UILabel!
    @IBOutlet weak var scroll_me: UIScrollView!
    @IBOutlet weak var pagecontroller: UIPageControl!
    
    
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
        let slides = createSlides()
        setupSlideScrollView(slides: slides)
        pagecontroller.numberOfPages = slides.count
        pagecontroller.currentPage = 0
        line_2act.isHidden = true
        
        self.scroll_me.contentSize = CGSize(width:750, height: 02)

    }
    func createSlides() -> [UIView] {
        
        let slide1:Shortnote = Bundle.main.loadNibNamed("Shortnote", owner: self, options: nil)?.first as! Shortnote
        
        let slide2:Cards = Bundle.main.loadNibNamed("Cards", owner: self, options: nil)?.first as! Cards
        
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
        pagecontroller.currentPage = Int(pageIndex)
        if pagecontroller.currentPage == 0 {
            from_obj.setImage(selectedimage[0], for: .normal)
            to_ltrobj.setImage(unselectedimage[1], for: .normal)
            UIView.animate(withDuration: 1, animations: {
                self.line_1act.isHidden = false
                self.line_2act.isHidden = true
            }, completion: nil)
        } else {
            from_obj.setImage(unselectedimage[0], for: .normal)
            to_ltrobj.setImage(selectedimage[1], for: .normal)
            UIView.animate(withDuration: 1, animations: {
                self.line_1act.isHidden = true
                self.line_2act.isHidden = false
            }, completion: nil)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func from_ltract(_ sender: Any) {
    }
    
    
    @IBAction func to_ltract(_ sender: Any) {
    }
}
