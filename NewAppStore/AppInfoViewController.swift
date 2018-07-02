//
//  AppInfoViewController.swift
//  NewAppStore
//
//  Created by 최호성 on 2018. 6. 13..
//  Copyright © 2018년 최호성. All rights reserved.
//

import UIKit

//let APP_INFO_URL = "https://itunes.apple.com/lookup?id=839333328&country=kr"

class AppInfoViewController: UIViewController {
    
    var selectApp:Entry?
    var appInfoData:AppInfo?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let appId = selectApp?.id?.attributes?.imId else{
            return;
        }

        let appInfoUrl = "https://itunes.apple.com/lookup?id=\(appId)&country=kr"
        guard let url = URL(string: appInfoUrl) else {
            return;
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, err) -> Void in
            guard let data = data else {
    
                return
            }
            
            do{
                self.appInfoData = try JSONDecoder().decode(AppInfo.self, from: data)
                print("appInfo \(self.appInfoData)")
            }catch let error{
                
            }
            
            
        }).resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
