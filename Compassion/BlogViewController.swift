//
//  BlogViewController.swift
//  CUKswift
//
//  Created by Geecon System Ltd. on 01/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class BlogViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var blogTableView: UITableView!

   // var contents = [1,2,3,4,5,6]

    var images = [UIImage(named:"Blogimage"),
                  UIImage(named:"Blogimage1"),
                  UIImage(named:"Blogimage2"),
                  UIImage(named:"Blogimage3"),
                  UIImage(named:"Blogimage4")]
    
    var titles = ["Albinism in Tanzania: living in fear",
                  "From fire to fashion: our amazing volunteers",
                  "A Tanzanian adventure through a child’s eyes",
                  "Why poverty isn’t just a girl thing",
                  "100 things I want my kids to know"]
    
    var dates = ["30 jun 2017",
                 "2 jun 2017",
                 "12 jun 2017",
                 "23 jun 2017",
                 "16 jun 2017"]
    
    var details = ["18-year-old Yona hasn’t just faced the challenges of growing up in poverty.",
                   
                   "All over the UK, our volunteers are giving their time and effort to release children from poverty in Jesus’ name.",
                   
                   "What is it like to sit in a classroom on the other side of the world? Can we still play our favourite games and laugh together even though we speak?",
                   
                   "We’ve talked a lot about the impact poverty has on women and girls. How girls are missing from the classroom.",
                   
                   "This Father's Day, we want to share a gift with you - something that made us smile and filled us with inspiration. One of our sponsors."];


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dates.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = self.blogTableView.dequeueReusableCell(withIdentifier: "blogcell", for: indexPath) as! BlogTableCell;
            cell.blog_img.image = images[indexPath.row];
            cell.title_lbl.text = titles[indexPath.row];
           // cell.datelbl.text = dates[indexPath.row-1];
            cell.blog_des.text = details[indexPath.row];
            return cell;
        }
        
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func back(_ sender: Any) {
        
        
        self.dismiss(animated: false, completion: nil)
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        view.window!.layer.add(transition, forKey: kCATransition)

        
    }


}
