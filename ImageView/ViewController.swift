//
//  ViewController.swift
//  my_practice_1
//
//  Created by 이태윤 on 2023/07/05.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var current_time: UILabel!
    @IBOutlet var chosen_time: UILabel!
    @IBOutlet var image_view: UIImageView!
    
    var img_on : UIImage?
    var img_off : UIImage?
    let interval = 1.0
    let selector : Selector = #selector(ViewController.updatetime)
    var n1 : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        img_on = UIImage(named : "lamp_on.png")
        img_off = UIImage(named: "lamp_off.png")
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: selector, userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func date_picker(_ sender: UIDatePicker) {
        let datepicker = sender
        let formatter = DateFormatter()
        let formatter_1 = DateFormatter()
        formatter.dateFormat = "yyyy - MM - dd / HH : mm : ss / EEE"
        formatter_1.dateFormat = "yyyy - MM - dd / HH : mm / EEE"
        chosen_time.text = "선택 시간 : " + formatter.string(from : datepicker.date)
        n1 = formatter_1.string(from : datepicker.date)
    }
    
    @objc func updatetime() {
        let date = NSDate()
        let formatter = DateFormatter()
        let formatter_2 = DateFormatter()
        formatter.dateFormat = "yyyy - MM - dd / HH : mm : ss / EEE"
        formatter_2.dateFormat = "yyyy - MM - dd / HH : mm / EEE"
        current_time.text = "현재 시간 : " + formatter.string(from: date as Date)
        if n1 == formatter_2.string(from : date as Date) {
            image_view.image = img_on
        } else {
            image_view.image = img_off
        }
    }
    
}

