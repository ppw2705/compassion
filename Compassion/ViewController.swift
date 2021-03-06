//
//  CUIHomePageVC.swift
//  Compassion
//
//  Created by Grevin on 26/07/17.
//  Copyright © 2017 Geecon. All rights reserved.
// Paresh

import UIKit
//import SDWebImage


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate {
    
     var CSponserchildRequestHandler          : SponserchildRequestHandler!
    
    @IBOutlet weak var tpview: UIView!
    @IBOutlet weak var blogTableView: UITableView!
    
    @IBOutlet weak var tpChildName: UILabel!
    @IBOutlet weak var tpSponsorshipLbl: UILabel!
    @IBOutlet weak var tpChildImg: UIImageView!
    @IBOutlet weak var blur_view: UIView!
    @IBOutlet weak var backward_btn: UIButton!
    @IBOutlet weak var forward_btn: UIButton!
    @IBOutlet weak var side_menu: UIView!
    @IBOutlet weak var not_obj: UIButton!
    @IBOutlet weak var menu_obj: UIButton!
    @IBOutlet weak var scroll_view: UIScrollView!
    var currentChild = 0
    var previousChild = -1
    var childName = ["Yaneth Lucero Huarca Cordova","Dawry David De Los Santos","Fedson Jean Baptiste","Iker Matias Rincones Balderramo","Yarith Paola Vargas Iriarte"]
    var childImg = ["https://media.ci.org/w_230,h_230,c_thumb,g_face/ChildPhotos/Published/04886112_889074.jpg","https://media.ci.org/w_230,h_230,c_thumb,g_face/v1495045051/ChildPhotos/Published/06158334_3c78a7.jpg","https://www.compassionuk.org/childimages/headshot/HA021901139.jpg","https://www.compassionuk.org/childimages/headshot/EC057200135.jpg","https://www.compassionuk.org/childimages/headshot/CO054400021.jpg"]
    
    var contents = [1,2,3,4,5,6]
    var images = [UIImage(named:"Blogimage"),UIImage(named:"Blogimage1"),UIImage(named:"Blogimage2"),UIImage(named:"Blogimage3"),UIImage(named:"Blogimage4")]
    
    var titles = ["Albinism in Tanzania: living in fear","From fire to fashion: our amazing volunteers","A Tanzanian adventure through a child’s eyes","Why poverty isn’t just a girl thing","100 things I want my kids to know"]
    
    var dates = ["30 jun 2017","2 jun 2017","12 jun 2017","23 jun 2017","16 jun 2017"]
    
    var details = ["18-year-old Yona hasn’t just faced the challenges of growing up in poverty.","All over the UK, our volunteers are giving their time and effort to release children from poverty in Jesus’ name.","What is it like to sit in a classroom on the other side of the world? Can we still play our favourite games and laugh together even though we speak?", "We’ve talked a lot about the impact poverty has on women and girls. How girls are missing from the classroom.","This Father's Day, we want to share a gift with you - something that made us smile and filled us with inspiration. One of our sponsors."];
    
    var selected = false as Bool;
    var sectionSelected = false as Bool;
    var sectionVisible = false as Bool;
    var isalreadyClicked = false as Bool;
    var lastContentOffset: CGFloat = 0.0
    var scrollTop = false as Bool
    var forward = false as Bool
    
    var m_cMainPagecontaineVC : CUIMainPagecontaineVC!
    
    func Intitialize(cMainPagecontaineVC : CUIMainPagecontaineVC)
    {
        self.m_cMainPagecontaineVC = cMainPagecontaineVC
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        isalreadyClicked = true
        
        tpview.isHidden = true
        tpChildImg.clipsToBounds = true
        tpChildImg.layer.cornerRadius = tpChildImg.frame.size.height/2;
//        self.SendChildInfoRequest()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.CSponserchildRequestHandler = SponserchildRequestHandler(completionHandler: self.ChildInfoRequestCallback)
        
        self.side_menu.isHidden = true
        self.menu_obj.isHidden=true
        self.blur_view.isHidden=true
        // Select

        // Do any additional setup after loading the view, typically from a nib.
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.someAction(_:)))
        self.blur_view.addGestureRecognizer(gesture)
        /*self.scroll_view.contentSize = CGSize(width:270, height: 650)
        */        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childName.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "childCollCell", for: indexPath) as! ChildCollectionViewCell
        
        /*let url = NSURL(string:childImg[indexPath.row])
        let data = NSData(contentsOf:url! as URL)
        if data != nil {
            myCell.Img.image = UIImage(data:data! as Data)
        }*/
        myCell.Img.sd_setImage(with: URL(string: childImg[indexPath.row]), placeholderImage: UIImage(named: "child4.png"))
        
        let fullNameArr = childName[indexPath.row].characters.split{$0 == " "}.map(String.init)
        
        myCell.Name.text = fullNameArr[0]
        
        myCell.Img.alpha = 0.5
        if myCell.isSelected {
            myCell.Img.alpha = 0
        }
        
        if indexPath.row == 1 {
            collectionView.selectItem(at: IndexPath(row:currentChild,section:0), animated: true, scrollPosition: .centeredHorizontally)
            self.collectionView((collectionView), didSelectItemAt: IndexPath(row:currentChild,section:0))
        }
        
        return myCell
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        currentChild = indexPath.row
        if currentChild != previousChild {
            let colcell = collectionView.cellForItem(at: indexPath) as! ChildCollectionViewCell
            colcell.Img.alpha = 1

        
            let cell = self.blogTableView.dequeueReusableCell(withIdentifier: "singlechildcell", for: IndexPath(row:2,section:0)) as! singleChildTableViewCell;
            cell.Namelbl.text = childName[currentChild]
            
            cell.childImage.sd_setImage(with: URL(string: childImg[indexPath.row]), placeholderImage: UIImage(named: "child4.png"))
            //self.blogTableView.reloadRows(at: [IndexPath(row:2,section:0)], with: .none)
            if previousChild < currentChild {
                self.blogTableView.reloadRows(at: [IndexPath(row:2,section:0)], with: .left)
            } else {
                self.blogTableView.reloadRows(at: [IndexPath(row:2,section:0)], with: .right)
            }
            
            self.tpChildImg.sd_setImage(with: URL(string: childImg[indexPath.row]), placeholderImage: UIImage(named: "child4.png"))
            self.tpChildName.text = childName[indexPath.row]
            previousChild = currentChild
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
       // if currentChild != previousChild {
            let colcell = collectionView.cellForItem(at: indexPath) as! ChildCollectionViewCell
            colcell.Img.alpha = 0.5
       // }
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else {
            return titles.count;
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let cell = self.blogTableView.dequeueReusableCell(withIdentifier: "notifycell", for: indexPath) as! NotifyTableViewCell;
                cell.notifyImage.layer.masksToBounds = true;
                cell.notifyClose.addTarget(self, action: #selector(deleteCell), for: .touchUpInside)
                cell.notifyClose.tag = indexPath.row;
                cell.notifyImage.layer.cornerRadius = cell.notifyImage.layer.frame.size.width / 2
                cell.notifyImage.layer.masksToBounds = true
                
                return cell;
            } else if indexPath.row == 1 {
                let cell = self.blogTableView.dequeueReusableCell(withIdentifier: "childcollectioncell", for: indexPath) as! ChildTableViewCell;
                return cell;
            } else {
                let cell = self.blogTableView.dequeueReusableCell(withIdentifier: "singlechildcell", for: indexPath) as! singleChildTableViewCell;
                return cell;
            }
        }else {
            let cell = self.blogTableView.dequeueReusableCell(withIdentifier: "blogcell", for: indexPath) as! BlogTableViewCell;
            cell.blogImage.image = images[indexPath.row];
            //cell.blogImage.sd_setImage(with: URL(string: childImg[indexPath.row]), placeholderImage: UIImage(named: "child4.png"))
            cell.titlelbl.text = titles[indexPath.row];
            cell.datelbl.text = dates[indexPath.row];
            cell.desclbl.text = details[indexPath.row];
            return cell;
        }
        
    }
    
    
    @objc func deleteCell(sender:UIButton){
        selected = true
        blogTableView.reloadData()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        

        if lastContentOffset < scrollView.contentOffset.y
        {
            //print("bottom")
            let cellRect = self.blogTableView.rectForRow(at: IndexPath(row:1,section:1))
            let completelyVisible = self.blogTableView.bounds.contains(cellRect)
            
            if !sectionVisible && completelyVisible {
                tpChildImg.isHidden = true
                tpChildName.isHidden = true
                tpSponsorshipLbl.isHidden = true

                self.tpview.isHidden = false
                let height = self.tpview.frame.size.height
                self.tpview.frame.size.height  = 0
                
                    sectionVisible = true
                    UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations:
                        {
                            self.tpview.frame.origin.y = self.blogTableView.frame.origin.y
                            self.tpview.frame.origin.x = self.blogTableView.frame.origin.x
                            //self.tpview.center         = self.view.center
                            self.tpview.frame.size.height  = height
                    
                    }, completion: ({ _ in
                        self.tpChildImg.isHidden = false
                        self.tpChildName.isHidden = false
                        self.tpSponsorshipLbl.isHidden = false
                    }))
            }
            
        }
        else if lastContentOffset > scrollView.contentOffset.y
        {
            //print("top")
            let cellRect = self.blogTableView.rectForRow(at: IndexPath(row:2,section:0))
            let cell : singleChildTableViewCell = self.blogTableView.dequeueReusableCell(withIdentifier: "singlechildcell", for: IndexPath(row:2,section:0)) as! singleChildTableViewCell
            var cellY = cell.bounds.origin.y + 420

            let completelyVisible = self.blogTableView.bounds.contains(cellRect)
            
            if scrollView.contentOffset.y <= cellY {

                if sectionVisible {
                    //print("hide the header")
                    tpview.isHidden = true
                }
                sectionVisible = false
            }
            
        } else {
            //print("Didnt Move")
        }
        lastContentOffset = scrollView.contentOffset.y
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        if selected == true && indexPath.section == 0 && indexPath.row == 0{
            return 0.0
        }
        
        if indexPath.section == 0 && indexPath.row == 0{
            return 86.0
        }
        
        if indexPath.section == 0 && indexPath.row == 1{
            return 90.0
        }
        if indexPath.section == 0 && indexPath.row == 2{
            return 353.0
        }
        
        return 245.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        return nil
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }
    
    
    
    @IBAction func act(_ sender: UIButton) {
        
        var tableCell: ChildTableViewCell? = (self.blogTableView.cellForRow(at: IndexPath(row:1,section:0)) as? ChildTableViewCell)
        // Deselect
        tableCell?.collectionView.deselectItem(at: IndexPath(row:currentChild,section:0), animated: true)
        self.collectionView((tableCell?.collectionView)!, didDeselectItemAt: IndexPath(row:currentChild,section:0))

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
        
        
        // Select
        tableCell?.collectionView.selectItem(at: IndexPath(row:currentChild,section:0), animated: true, scrollPosition: .centeredHorizontally)
        self.collectionView((tableCell?.collectionView)!, didSelectItemAt: IndexPath(row:currentChild,section:0))
    }
    
    
    @IBAction func menu_act(_ sender: Any) {
        
        
//        SendChildInfoRequest()
        
        let transition = CATransition()
        transition.duration = 0.2
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        self.side_menu.window!.layer.add(transition, forKey: kCATransition)
        self.side_menu.isHidden = false
        self.blur_view.isHidden=false

        
        
    }
    
    @IBAction func noti_view(_ sender: Any) {
        
    }
    
    func someAction(_ sender:UITapGestureRecognizer){
        if self.side_menu.isHidden == false {
            
            
            let transition = CATransition()
            transition.duration = 0.2
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromRight
            self.side_menu.window!.layer.add(transition, forKey: kCATransition)
            self.side_menu.isHidden = true
            self.not_obj.isHidden=false
            self.blur_view.isHidden=true

            
        }
    }
    
    /*@IBAction func close_act(_ sender: Any) {
        
        let transition = CATransition()
        transition.duration = 0.2
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        self.side_menu.window!.layer.add(transition, forKey: kCATransition)
        self.side_menu.isHidden = true
        self.not_obj.isHidden=false
        
    }*/
    
    
    //sidemenu_Actions
    @IBAction func add_reminder(_ sender: Any) {
    }
    
    
    @IBAction func blog_acts(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let HelpViewC = storyBoard.instantiateViewController(withIdentifier: "BlogViewControl") as! BlogViewController
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        view.window!.layer.add(transition, forKey: kCATransition)
        self.present(HelpViewC, animated: false, completion: nil)
        self.side_menu.isHidden = true
        self.not_obj.isHidden=false
        self.blur_view.isHidden=true
        
        
    }
    
    
    @IBAction func inspiring_filmsacts(_ sender: Any) {
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let HelpViewC = storyBoard.instantiateViewController(withIdentifier: "InspiringfilmsController") as! InspiringfilmsController
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        view.window!.layer.add(transition, forKey: kCATransition)
        self.present(HelpViewC, animated: false, completion: nil)
        self.side_menu.isHidden = true
        self.not_obj.isHidden=false
        self.blur_view.isHidden=true
        
        
    }
    
    
    @IBAction func visityour_childacts(_ sender: Any) {
    }
    
    
    @IBAction func help_acts(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let HelpViewC = storyBoard.instantiateViewController(withIdentifier: "HelpViewController") as! HelpViewController
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        view.window!.layer.add(transition, forKey: kCATransition)
        self.present(HelpViewC, animated: false, completion: nil)
        self.side_menu.isHidden = true
        self.not_obj.isHidden=false
        self.blur_view.isHidden=true
    }
    
    
    @IBAction func sponsorachild_acts(_ sender: Any) {
    }
    
    @IBAction func volunteer_acts(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let Volunte = storyBoard.instantiateViewController(withIdentifier: "VolunteeroneController") as! VolunteeroneController
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        view.window!.layer.add(transition, forKey: kCATransition)
        self.present(Volunte, animated: false, completion: nil)
        self.side_menu.isHidden = true
        self.not_obj.isHidden=false
        self.blur_view.isHidden=true

        
        
        
        
    }
    
    @IBAction func sponsorshipplus_acts(_ sender: Any) {
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let Sponsorplus = storyBoard.instantiateViewController(withIdentifier: "SponsorplusController") as! SponsorplusController
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        view.window!.layer.add(transition, forKey: kCATransition)
        self.present(Sponsorplus, animated: false, completion: nil)
        self.side_menu.isHidden = true
        self.not_obj.isHidden=false
        self.blur_view.isHidden=true

    }
    
    
    @IBAction func sponsorshipfaqs_acts(_ sender: Any) {
    }
    
    
    @IBAction func notifpref_acts(_ sender: Any) {
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let NotiPrefenC = storyBoard.instantiateViewController(withIdentifier: "NotiPrefenController") as! NotiPrefenController
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        view.window!.layer.add(transition, forKey: kCATransition)
        self.present(NotiPrefenC, animated: false, completion: nil)
        self.side_menu.isHidden = true
        self.not_obj.isHidden=false
        self.blur_view.isHidden=true

        
        
    }
    
    
    @IBAction func privacypolicy_acts(_ sender: Any) {
    }
    
    
    @IBAction func about_meacts(_ sender: Any) {
    }
    
    
   
   
    
    
    func SendChildInfoRequest()
    {
        CSponserchildRequestHandler.CSponserchildRequest.UserId = "229207"
        CSponserchildRequestHandler.HTTPSendRequest()
    }
    
    func ChildInfoRequestCallback(cSender:NSObject, nErrorCode:Int16, cErrorString:String)
    {
        
        DispatchQueue.main.async
            {
            
            
            
//            if nErrorCode == CTDeOperationStatus.OS_SUCCESS.rawValue
//            {
//                //self.OnSuccess()
//                
//                print("success...!!!!!!!")
//            }
//            else
//            {
//                print("error in response \(cErrorString)")
//            }
        }
        
    }


}

