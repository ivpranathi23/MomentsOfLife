//
//  DiaryTextViewController.swift
//  MomentsOfLife
//
//  Created by Venkata Pranathi on 21/05/19.
//  Copyright © 2019 Venkata Pranathi. All rights reserved.
//

import UIKit

class DiaryTextViewController: UIViewController {
 
    
    var emotionString: String?
    var textdate: Date?
  
    @IBOutlet weak var diaryTextView: UITextView!
    @IBOutlet weak var emojiImage: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emojiImage.image = UIImage(named: emotionString!)

        self.diaryTextView.layer.borderWidth = 1.0
        self.diaryTextView.layer.borderColor = UIColor.darkGray.cgColor
        self.diaryTextView.layer.cornerRadius = 10
        self.diaryTextView.layer.masksToBounds = true
        
        self.navigationItem.title = "Detail Record of the emotion"

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.diaryTextView.text = ""
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        if self.diaryTextView.text != nil && self.diaryTextView.text != "" {
            CoreDataManager.sharedInstance.save(emotionName: emotionString!, diaryText: self.diaryTextView.text, diaryDate: textdate!)
            self.displayAlert(messageString: "Your emotions were saved Successfully")
        } else {
            self.displayAlert(messageString: "Please describe your day")

        }
    }

    func displayAlert(messageString: String) {
        let alert = UIAlertController(title: "Alert", message: messageString, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            self.navigationController?.popToRootViewController(animated: true)
        }))
        self.present(alert, animated: true)
    }
}
