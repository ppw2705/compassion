//
//  MyCommunityVC.swift
//  Compassion
//
//  Created by Grevin on 10/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit
import GoogleMaps

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
    @IBOutlet weak var forward_btn: UIButton!
    @IBOutlet weak var backward_btn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    var m_cMapSlide : WeatherNMap!
    var m_cFactsSlide : Facts!
    var m_cFoodSlide : Food!
    
    var currentChild = 0
    var previousChild = -1
    var childName = ["Yaneth Lucero Huarca Cordova","Dawry David De Los Santos","Fedson Jean Baptiste","Iker Matias Rincones Balderramo","Yarith Paola Vargas Iriarte"]
    var childImg = ["https://media.ci.org/w_230,h_230,c_thumb,g_face/ChildPhotos/Published/04886112_889074.jpg","https://media.ci.org/w_230,h_230,c_thumb,g_face/v1495045051/ChildPhotos/Published/06158334_3c78a7.jpg","https://www.compassionuk.org/childimages/headshot/HA021901139.jpg","https://www.compassionuk.org/childimages/headshot/EC057200135.jpg","https://www.compassionuk.org/childimages/headshot/CO054400021.jpg"]
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
        
        m_cMainPagecontaineVC.blur_views.isHidden = false
        m_cMainPagecontaineVC.menu_iconobj.isHidden = true
        m_cMainPagecontaineVC.blur_views.backgroundColor = UIColor.blue
        m_cMainPagecontaineVC.blur_views.alpha = 1
        
        m_cMainPagecontaineVC.activityIndicatorView.startAnimating()
        
        scrollView.delegate = self
        let slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        factsView.isHidden = true
        foodView.isHidden = true
        // Do any additional setup after loading the view.
        self.scroll_me.contentSize = CGSize(width:1125, height: 02)
        let fullNameArr = childName[0].characters.split{$0 == " "}.map(String.init)
        titleLbl.text = fullNameArr[0] + "'s Community"

        let camera = GMSCameraPosition.camera(withLatitude: 46.2276, longitude: 2.2137, zoom: 4.0)
        let mapView1 = GMSMapView.map(withFrame: m_cMapSlide.mapView.bounds, camera: camera)
        mapView1.isMyLocationEnabled = true
//        mapView1.delegate = self as! GMSMapViewDelegate
        //mapView1.camera = camera
        m_cMapSlide.mapView = mapView1
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 46.2276, longitude: 2.2137)
        marker.title = "My Sydney"
        marker.snippet = "Australia"
        marker.groundAnchor = CGPoint(x: 0.5, y: 1)//new line add
        marker.appearAnimation = GMSMarkerAnimation.pop
        marker.map = mapView1
        
        let urlString = URL(string: "http://api.openweathermap.org/data/2.5/weather?lat=-1.89686&lon=30.27355&units=metric&APPID=7781e9a04446fb5264ad26eccda772b6")
        
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error)
                } else {
                    if let usableData = data {
                        print(usableData) //JSONSerialization
                    }
                }
            }
            task.resume()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        m_cMainPagecontaineVC.activityIndicatorView.stopAnimating()
        m_cMainPagecontaineVC.blur_views.isHidden = true
        m_cMainPagecontaineVC.menu_iconobj.isHidden = false
    }
    
    func createSlides() -> [UIView] {
        let slide1:WeatherNMap = Bundle.main.loadNibNamed("WeatherNMap", owner: self, options: nil)?.first as! WeatherNMap
        
        m_cMapSlide = slide1
        
        let slide2:Facts = Bundle.main.loadNibNamed("Facts", owner: self, options: nil)?.first as! Facts
        
        m_cFactsSlide = slide2
        
        let slide3:Food = Bundle.main.loadNibNamed("Food", owner: self, options: nil)?.first as! Food
        
        m_cFoodSlide = slide3
        
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
    }
    
    @IBAction func FactsAct(_ sender: Any) {
        var frame: CGRect = scrollView.frame
        frame.origin.x = frame.size.width * 1
        frame.origin.y = 0
        scrollView.scrollRectToVisible(frame, animated: true)
        pageControl.currentPage = 1
    }
    
    @IBAction func FoodAct(_ sender: Any) {
        var frame: CGRect = scrollView.frame
        frame.origin.x = frame.size.width * 2
        frame.origin.y = 0
        scrollView.scrollRectToVisible(frame, animated: true)
        pageControl.currentPage = 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        titleLbl.text = fullNameArr[0] + "'s Community"
        /*m_cLifeSlide.childName.text = childName[currentChild]
        let url = NSURL(string:childImg[currentChild])
        let data = NSData(contentsOf:url! as URL)
        if data != nil {
            m_cLifeSlide.childImg.image = UIImage(data:data! as Data)
        }*/
        
        
    }

}
