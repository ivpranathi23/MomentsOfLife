//
//  ViewController.swift
//  MomentsOfLife
//
//  Created by Venkata Pranathi on 21/05/19.
//  Copyright © 2019 Venkata Pranathi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var cryingView: UIView!
    @IBOutlet weak var coolView: UIView!
    @IBOutlet weak var lovedView: UIView!
    @IBOutlet weak var angryView: UIView!
    @IBOutlet weak var sadView: UIView!
    @IBOutlet weak var happyView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let happyViewtap = UITapGestureRecognizer(target: self, action: #selector(self.happyViewTap(_:)))
        happyViewtap.delegate = self // This is not required
        self.happyView.addGestureRecognizer(happyViewtap)
        
        let sadViewtap = UITapGestureRecognizer(target: self, action: #selector(self.sadViewTap(_:)))
        sadViewtap.delegate = self // This is not required
        self.sadView.addGestureRecognizer(sadViewtap)
        
        let lovedViewtap = UITapGestureRecognizer(target: self, action: #selector(self.lovedViewTap(_:)))
        lovedViewtap.delegate = self // This is not required
        self.lovedView.addGestureRecognizer(lovedViewtap)
        
        let angryViewtap = UITapGestureRecognizer(target: self, action: #selector(self.angryViewTap(_:)))
        angryViewtap.delegate = self // This is not required
        self.angryView.addGestureRecognizer(angryViewtap)
        
        let coolViewtap = UITapGestureRecognizer(target: self, action: #selector(self.coolViewTap(_:)))
        coolViewtap.delegate = self // This is not required
        self.coolView.addGestureRecognizer(coolViewtap)
        
        let cryingViewtap = UITapGestureRecognizer(target: self, action: #selector(self.cryingViewTap(_:)))
        cryingViewtap.delegate = self // This is not required
        self.cryingView.addGestureRecognizer(cryingViewtap)
        // Do any additional setup after loading the view.
    }
    
    @objc func happyViewTap(_ sender: UITapGestureRecognizer) {
        self.pushtonextvc(emotionstring: "happy")
    }
    
    @objc func sadViewTap(_ sender: UITapGestureRecognizer) {
        self.pushtonextvc(emotionstring: "sad")
    }

    
    @objc func lovedViewTap(_ sender: UITapGestureRecognizer) {
        self.pushtonextvc(emotionstring: "loved")

    }
    
    @objc func coolViewTap(_ sender: UITapGestureRecognizer) {
        self.pushtonextvc(emotionstring: "cool")

        
    }
    
    @objc func angryViewTap(_ sender: UITapGestureRecognizer) {
        self.pushtonextvc(emotionstring: "angry")
    }
    
    @objc func cryingViewTap(_ sender: UITapGestureRecognizer) {
        self.pushtonextvc(emotionstring: "crying")

    }
    
    func pushtonextvc(emotionstring: String) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "nextdatepickerVC") as? DatePickerViewController
        vc?.emotionString = emotionstring
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

