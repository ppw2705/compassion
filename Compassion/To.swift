//
//  To.swift
//  Compassion
//
//  Created by Geecon System Ltd. on 16/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class To: UIView, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var letters_collect: UICollectionView!
    
    @IBOutlet weak var scroll_me: UIScrollView!
    @IBOutlet weak var child_imgs: UIImageView!
    @IBOutlet weak var btn_view: UIView!
    @IBOutlet weak var des_view: UIView!
    
    
    var images = [UIImage(named:"1-12-1"),
                  UIImage(named:"2-11-1"),
                  UIImage(named:"2-11-1"),
                  UIImage(named:"2-11-1"),
                  UIImage(named:"2-11-1")]
    var dates = ["30 jun 2017",
                 "2 jun 2017",
                 "12 jun 2017",
                 "23 jun 2017",
                 "16 jun 2017"]
    
    
    let cellIdentifier = "LettersCollectionCell"


    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        
        self.btn_view.layer.cornerRadius = 18
        self.btn_view.layer.masksToBounds = true
        self.des_view .isHidden = true
        
        child_imgs.layer.cornerRadius = child_imgs.layer.frame.size.width / 2
        child_imgs.layer.masksToBounds = true
        
        child_imgs.layer.borderWidth = 7;
        child_imgs.layer.borderColor = UIColor(
            red: 66.0/255.0,
            green: 97.0/255.0,
            blue: 163.0/255.0,
            alpha: CGFloat(1.0)
            ).cgColor
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.someAction(_:)))
        self.scroll_me.addGestureRecognizer(gesture)

        
        self.letters_collect.delegate = self
        self.letters_collect.dataSource = self
        
        self.letters_collect.register(UINib(nibName:"LettersCollectionCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! LettersCollectionCell
        
        cell.date_letter.text = self.dates[indexPath.row]
        cell.image_letters.image = self.images[indexPath.row]
        
        return cell
    }

    @IBAction func fAct(_ sender: Any) {
    }
    @IBAction func bAct(_ sender: Any) {
    }
    @IBAction func read(_ sender: Any) {
        self.des_view.isHidden=false

    }
    
    func someAction(_ sender:UITapGestureRecognizer){
       // self.scroll_me.contentSize = CGSize(width:270, height: 850)
        
        if self.des_view.isHidden == false {
            self.scroll_me.contentSize = CGSize(width:270, height: 850)

            self.des_view.isHidden=true
            
        }}

}
