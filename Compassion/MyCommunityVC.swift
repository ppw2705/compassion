//
//  MyCommunityVC.swift
//  Compassion
//
//  Created by Grevin on 10/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class MyCommunityVC: UIViewController, UIScrollViewDelegate {

    
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var map_btn: UIButton!
    @IBOutlet weak var food_btn: UIButton!
    @IBOutlet weak var facts_btn: UIButton!
    @IBOutlet weak var mapView: UILabel!
    @IBOutlet weak var factsView: UILabel!
    @IBOutlet weak var foodView: UILabel!
    @IBOutlet weak var scroll_me: UIScrollView!
    
    
    var selectedimage = [UIImage(named:"map.png"),UIImage(named:"facts.png"),UIImage(named:"food.png")]
    var unselectedimage = [UIImage(named:"map1.png"),UIImage(named:"facts1.png"),UIImage(named:"food1.png")]
    var titles = ["Map + Weather","Facts","Food"]
    
    var m_cMainPagecontaineVC : CUIMainPagecontaineVC!
    var m_cMyCommunityPageVC       : MyCommunityVC!
    func Intitialize(cMainPagecontaineVC : CUIMainPagecontaineVC)
    {
        self.m_cMainPagecontaineVC = cMainPagecontaineVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        let slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        factsView.isHidden = true
        foodView.isHidden = true
        // Do any additional setup after loading the view.
        self.scroll_me.contentSize = CGSize(width:1125, height: 02)

    }
    
    func createSlides() -> [UIView] {
        let slide1:WeatherNMap = Bundle.main.loadNibNamed("WeatherNMap", owner: self, options: nil)?.first as! WeatherNMap
        
        let slide2:Facts = Bundle.main.loadNibNamed("Facts", owner: self, options: nil)?.first as! Facts
        
        let slide3:Food = Bundle.main.loadNibNamed("Food", owner: self, options: nil)?.first as! Food
        
        return [slide1,slide2,slide3]
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
            map_btn.setImage(selectedimage[0], for: .normal)
            facts_btn.setImage(unselectedimage[1], for: .normal)
            food_btn.setImage(unselectedimage[2], for: .normal)
            UIView.animate(withDuration: 1, animations: {
                self.mapView.isHidden = false
                self.factsView.isHidden = true
                self.foodView.isHidden = true
            }, completion: nil)
        } else if pageControl.currentPage == 1 {
            map_btn.setImage(unselectedimage[0], for: .normal)
            facts_btn.setImage(selectedimage[1], for: .normal)
            food_btn.setImage(unselectedimage[2], for: .normal)
            UIView.animate(withDuration: 1, animations: {
                self.mapView.isHidden = true
                self.factsView.isHidden = false
                self.foodView.isHidden = true
            }, completion: nil)
        } else {
            map_btn.setImage(unselectedimage[0], for: .normal)
            facts_btn.setImage(unselectedimage[1], for: .normal)
            food_btn.setImage(selectedimage[2], for: .normal)
            UIView.animate(withDuration: 1, animations: {
                self.mapView.isHidden = true
                self.factsView.isHidden = true
                self.foodView.isHidden = false
            }, completion: nil)
            
        }
    }
    
    @IBAction func MapAct(_ sender: Any) {
        var frame: CGRect = scrollView.frame
        frame.origin.x = frame.size.width * 0
        frame.origin.y = 0
        scrollView.scrollRectToVisible(frame, animated: true)
        pageControl.currentPage = 0
        map_btn.setImage(selectedimage[0], for: .normal)
        facts_btn.setImage(unselectedimage[1], for: .normal)
        food_btn.setImage(unselectedimage[2], for: .normal)
        
    }
    
    @IBAction func FactsAct(_ sender: Any) {
        var frame: CGRect = scrollView.frame
        frame.origin.x = frame.size.width * 1
        frame.origin.y = 0
        scrollView.scrollRectToVisible(frame, animated: true)
        pageControl.currentPage = 1
        map_btn.setImage(unselectedimage[0], for: .normal)
        facts_btn.setImage(selectedimage[1], for: .normal)
        food_btn.setImage(unselectedimage[2], for: .normal)
    }
    
    @IBAction func FoodAct(_ sender: Any) {
        var frame: CGRect = scrollView.frame
        frame.origin.x = frame.size.width * 2
        frame.origin.y = 0
        scrollView.scrollRectToVisible(frame, animated: true)
        pageControl.currentPage = 2
        map_btn.setImage(unselectedimage[0], for: .normal)
        facts_btn.setImage(unselectedimage[1], for: .normal)
        food_btn.setImage(selectedimage[2], for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func bAck(_ sender: Any) {
        
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        scrollView!.layer.add(transition, forKey: kCATransition)

        
    }
    @IBAction func fWord(_ sender: Any) {
        
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        scrollView!.layer.add(transition, forKey: kCATransition)

    }
}
