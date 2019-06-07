//
//  detaileddescViewController.swift
//  MomentsOfLife
//
//  Created by Venkata Pranathi on 28/05/19.
//  Copyright © 2019 Venkata Pranathi. All rights reserved.
//

import UIKit

class detaileddescViewController: UIViewController {

    var detailedDairy: PersonalDiary?

    @IBOutlet weak var detailedDiarytext: UILabel!
    @IBOutlet weak var emotionImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let diary = detailedDairy {
            self.detailedDiarytext.text = diary.diaryText
            if let imagename = diary.emotionName {
                if let emotionImage = UIImage(named: imagename) {
                    self.emotionImg.image = emotionImage
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
