//
//  ActivityTableViewCell.swift
//  playWithMe
//
//  Created by murray on 2018/3/20.
//  Copyright © 2018年 Murray. All rights reserved.
//

import UIKit
import RealmSwift

class ActivityTableViewCell: UITableViewCell {
    @IBOutlet weak var detailTV: UITextView!
    @IBOutlet weak var addBT: UIButton!
    @IBOutlet weak var numberLB: UILabel!
    @IBOutlet weak var timeLB: UILabel!
    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var usernameLB: UILabel!
    @IBOutlet weak var nameLB: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        UIButton.setButton(button: addBT)
        addBT.backgroundColor =  UIColor(red: 30/255.0, green: 144/255.0, blue: 1.0, alpha: 1.0)
        headImage.layer.cornerRadius = 30
        headImage.layer.masksToBounds = true 
        // Initialization code
    }

    //加入该活动
    @IBAction func joinIn(_ sender: Any) {
        let realm = try! Realm()
        let activity = realm.objects(Activity.self).filter("name == %@", nameLB.text!).first
        let user = getMeInfo()
        try! realm.write {
            if !checkActivity(activity: activity!){
                activity?.users.append(user)
                user.activity.append(activity!)
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
