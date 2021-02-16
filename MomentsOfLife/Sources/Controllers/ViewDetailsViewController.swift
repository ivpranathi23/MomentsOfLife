//
//  ViewDetailsViewController.swift
//  MomentsOfLife
//
//  Created by Venkata Pranathi on 21/05/19.
//  Copyright © 2019 Venkata Pranathi. All rights reserved.
//

import UIKit
import CoreData


class ViewDetailsViewController: UIViewController {
    
    @IBOutlet weak var viewdetailsTableView: UITableView!
    var listOfDetails: [PersonalDiary] = [PersonalDiary]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let listOfdetails = CoreDataManager.sharedInstance.fetchData() {
            listOfDetails = listOfdetails
        }
        self.navigationItem.title = "Record of your emotions"
        self.viewdetailsTableView.tableFooterView = UIView()
    }

}

extension ViewDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listOfDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "viewdetailscell", for: indexPath) as? ViewDetailsTableViewCell
        if let imagename = listOfDetails[indexPath.row].emotionName {
            if let emotionImage = UIImage(named: imagename) {
                cell?.emotionImage.image = emotionImage
            }
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let selectedDate = dateFormatter.string(from: listOfDetails[indexPath.row].diaryDate! as Date)
        
        cell?.date.text = selectedDate
        cell?.contentdescription.text = listOfDetails[indexPath.row].diaryText
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let personaldiaryselected = self.listOfDetails[indexPath.row]
       
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "detaileddiary") as? detaileddescViewController
        vc!.detailedDairy = personaldiaryselected

        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
}
