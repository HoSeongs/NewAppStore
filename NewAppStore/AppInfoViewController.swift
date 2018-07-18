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

    @IBOutlet weak var appImage: UIImageView!
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var appDescription: UILabel!
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var gradeScore: UILabel!
    @IBOutlet weak var gradeImage: UIImageView!
    @IBOutlet weak var ageClass: UILabel!
    @IBOutlet weak var gradeCount: UILabel!
    @IBOutlet weak var ageDescription: UILabel!
    
    
    @IBAction func appDownload(_ sender: Any) {
    }
    
    @IBAction func appShare(_ sender: Any) {
    }
    
    
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
                print("오류 발생")
                return
            }
            
            do{
                self.appInfoData = try JSONDecoder().decode(AppInfo.self, from: data)
                self.setData()
            }catch let error{
                print(error.localizedDescription)
            }
            
            
        }).resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setData(){
        
        if (self.appInfoData == nil){
            return
        }
        
        guard let cnt = self.appInfoData?.resultCount, cnt < 1 else{
            print("결과가 없습니다.")
            return
        }
        
        guard let artworkUrl60 = self.appInfoData?.results?[cnt-1].artworkUrl60, let artworkUrl512 = self.appInfoData?.results?[cnt-1].artworkUrl512, let artworkUrl100 = self.appInfoData?.results?[cnt-1].artworkUrl100 else{
            return
        }
        
        let appImgUrl60:URL = URL(string: artworkUrl60)!
        let appImgUrl512:URL = URL(string: artworkUrl512)!
        let appImgUrl100:URL = URL(string: artworkUrl100)!
        
        DispatchQueue(label: "appImageDown").async {
            if let appImage = try? Data(contentsOf: appImgUrl60){
                self.appImage.image = UIImage(data: appImage)
            }
        }
        
        
        
        
        
        
        
        
        //self.appImage.image =
        
        
        
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
