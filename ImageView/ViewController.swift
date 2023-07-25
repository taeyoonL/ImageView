//
//  ViewController.swift
//  ImageView
//
//  Created by 이태윤 on 2023/07/04.
//

import UIKit

class ViewController: UIViewController {
    var isZoom = false
    var imgOn : UIImage?
    var imgOff : UIImage?
    
    @IBOutlet var Image_1: UIImageView!
    @IBOutlet var button_1: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named : "lamp_off.png")
        Image_1.image = imgOn
        // Do any additional setup after loading the view.
    }

    
    @IBAction func button_resize_image(_ sender: UIButton) {
        let scale : CGFloat = 2.0
        var newWidth : CGFloat
        var newHeight : CGFloat
        
        if (isZoom) {
            newWidth = Image_1.frame.width/scale
            newHeight = Image_1.frame.height/scale
            button_1.setTitle("확대", for: .normal)
        } else {
            newWidth = Image_1.frame.width*scale
            newHeight = Image_1.frame.height*scale
            button_1.setTitle("축소", for: .normal)
        }
        
        Image_1.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    
    @IBAction func switch_resize_image(_ sender: UISwitch) {
        if sender.isOn {
            Image_1.image = imgOn
        } else {
            Image_1.image = imgOff
        }
    }
    
}

