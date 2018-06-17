//
//  AppListViewController.swift
//  NewAppStore
//
//  Created by 최호성 on 2018. 6. 3..
//  Copyright © 2018년 최호성. All rights reserved.
//

import UIKit

let LIST_URL:String = "https://itunes.apple.com/kr/rss/topfreeapplications/limit=50/genre=6015/json"

var AppList:AppRanking?
var appImageArray:[String:[String:Any]] = [:]

class AppListViewController: UIViewController {
    
    @IBOutlet weak var appListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appListTableView.delegate = self
        appListTableView.dataSource = self

        guard let url = URL(string: LIST_URL) else{
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, err) -> Void in
            guard let data = data else{
                return
            }
            
            do{
                AppList = try JSONDecoder().decode(AppRanking.self, from: data)
                
                if(AppList != nil){
                    DispatchQueue.main.sync {
                        self.appListTableView.reloadData()
                    }
                }
            }catch let error{
                print(error.localizedDescription)
            }
        }).resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "selectedSegue"{
            print("selectedSegue")
            if let destination = segue.destination as? AppInfoViewController,let selectedRow = self.appListTableView.indexPathForSelectedRow?.row, let selectedAppInfo = AppList?.feed?.entry?[selectedRow]{
                destination.appInfo = selectedAppInfo
            }
        }
    }

}

extension AppListViewController:UITableViewDataSource{


    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let number = AppList?.feed?.entry?.count else{
            return 0
        }
        return number
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppListCell", for: indexPath) as! AppListCell
        
        
        //앱 이미지 설정
        if let imageArray = AppList?.feed?.entry?[indexPath.row].imImage{
            for imgInfo in imageArray { //이미지 3개의 URL이 for문의 대상
                if let strImgSize = imgInfo.attributes?.height{
                    if let _ = appImageArray.index(forKey: String(indexPath.row)), let storedImgData = appImageArray[String(indexPath.row)]![strImgSize]{
                        if strImgSize == "75"{
                            cell.appImage.image = UIImage(data: storedImgData as! Data)
                        }
                    }else{
                        if let strUrl = imgInfo.label, let url = URL(string: strUrl){
                            DispatchQueue(label: "imageDown").async{ //serial(single thread 방식 - 속도가 multi thread 보다 빠르다고 한다...)방식의 gcd
                                if let imgData = try? Data(contentsOf: url){
                                    DispatchQueue.main.sync {
                                        
                                        if let _ = appImageArray.index(forKey: String(indexPath.row)){ //indexPath.row에 해당하는 Dictionary가 있을 경우 해당 Dictionary에 추가
                                            appImageArray[String(indexPath.row)]![strImgSize] = imgData
                                        }else{//indexPath.row에 해당하는 Dictionary가 없을 경우 appImageArry에 row key를 추가하고 Dictionary value를 추가한다
                                            appImageArray[String(indexPath.row)] = [strImgSize:imgData]
                                        }
                                        
                                        if strImgSize == "75"{
                                            cell.appImage.image = UIImage(data: imgData)
                                        }
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
        //앱 랭킹 설정
        cell.appRanking.text = String(indexPath.row + 1)
        
        //앱 이름 설정
        if let appName = AppList?.feed?.entry?[indexPath.row].imName?.label{
            cell.appName.text = appName
        }
        
        //앱 다운버튼 설정
        if let btnTitle = AppList?.feed?.entry?[indexPath.row].imPrice?.label{
            cell.downButton.setTitle(btnTitle, for: UIControlState.normal)
        }
        
        return cell
    }
}

extension AppListViewController:UITableViewDelegate{

}

