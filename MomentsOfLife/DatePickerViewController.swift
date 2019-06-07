//
//  DatePickerViewController.swift
//  MomentsOfLife
//
//  Created by Venkata Pranathi on 21/05/19.
//  Copyright © 2019 Venkata Pranathi. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var emojiImage: UIImageView!
   
    var emotionString: String?
    @IBOutlet weak var diaryDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emojiImage.image = UIImage(named: emotionString!)
    }
  
    @IBAction func nextButtonTapped(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "diaryTextVC") as?DiaryTextViewController
        vc?.emotionString = self.emotionString
        vc?.textdate = self.diaryDatePicker.date
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
}
