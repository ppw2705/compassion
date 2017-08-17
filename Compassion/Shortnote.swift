//
//  Shortnote.swift
//  Compassion
//
//  Created by Geecon System Ltd. on 17/08/17.
//  Copyright © 2017 Geecon. All rights reserved.
//

import UIKit

class Shortnote: UIView, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var preview_view: UIView!
    @IBOutlet weak var scroll_me: UIScrollView!
    @IBOutlet weak var text_enter: UITextView!
    @IBOutlet weak var add_view: UIView!
    @IBOutlet weak var image_add1: UIImageView!
    @IBOutlet weak var image_add2: UIImageView!
    
    let picker = UIImagePickerController()

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        scroll_me.contentSize = CGSize(width:0, height: 0)
        
        self.preview_view.layer.cornerRadius = 18
        self.preview_view.layer.masksToBounds = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(Shortnote.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(Shortnote.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        
        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.text_enter.frame.size.width, height: 30))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem:    .flexibleSpace, target: nil, action: nil)
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(Shortnote.doneButtonAction))
        toolbar.setItems([flexSpace, doneBtn], animated: true)
        toolbar.sizeToFit()
        self.text_enter.inputAccessoryView = toolbar

        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        image_add2.isUserInteractionEnabled = true
        image_add2.addGestureRecognizer(tapGestureRecognizer)


        
    }
    
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        let alert:UIAlertController=UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.openCamera()
        }
        let gallaryAction = UIAlertAction(title: "Gallary", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.openGallary()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel)
        {
            UIAlertAction in
        }
        
        // Add the actions
        picker.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
       // self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)){
            picker.sourceType = UIImagePickerControllerSourceType.camera
            //self .presentViewController(Shortnote, animated: true, completion: nil)
        }else{
            let alert = UIAlertView()
            alert.title = "Warning"
            alert.message = "You don't have camera"
            alert.addButton(withTitle: "OK")
            alert.show()
        }
    }
    func openGallary(){
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
      //  self.presentViewController(picker, animated: true, completion: nil)
    }

    
    
    private func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        picker .dismiss(animated: true, completion: nil)
        image_add2.image=info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        print("picker cancel.")
    }
    
    
    func doneButtonAction() {
        self.text_enter.endEditing(true)
    }
    
    
    func keyboardWillShow(sender: NSNotification) {
        self.add_view.frame.origin.y -= 180
//        self.preview_view.frame.origin.y -= 220

    }
    func keyboardWillHide(sender: NSNotification) {
        self.add_view.frame.origin.y += 180
//        self.preview_view.frame.origin.y += 220

    }
    
    @IBAction func preview_act(_ sender: Any) {
    }
    
    
}
