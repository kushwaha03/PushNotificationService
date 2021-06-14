//
//  NotificationViewController.swift
//  NotificationServices
//
//  Created by Krishna Kushwaha on 13/06/21.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var label: UILabel?
    @IBOutlet weak var notificationImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        self.label?.text = notification.request.content.body
        self.label?.textAlignment = .center
        self.label?.textColor = .white
        preferredContentSize.height = 256
        print(notification.request.content.body)
        let content = notification.request.content
        if let aps = content.userInfo["aps"] as? [String: AnyHashable],
           let imageURL = aps["image_url"] as? String {
            print(imageURL)
            if let url = URL(string: imageURL ){
                                            
                do {
                     let data = try Data(contentsOf: url)
                      self.notificationImg.image = UIImage(data: data)
                     }
                        catch let err {
                               print(" Error : \(err.localizedDescription)")
                                }
                                            
                                            
                }
        }
    }

}
