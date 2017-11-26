//
//  TableViewController.swift
//  新北公車通
//
//  Created by 林松賢 on 2017/11/18.
//  Copyright © 2017年 Steven. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var busData = [String]()
    var incomingRouteTitle = ""
    var url = ""
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print("進入 \(incomingRouteTitle)")
        switch incomingRouteTitle {
        case "一般公車路線":
            self.navigationItem.title = "一般公車路線"
            url = "http://data.ntpc.gov.tw/od/data/api/915D8F36-AD62-4954-AAE3-610D9B62FC10?$format=json"
        case "快速公車":
            self.navigationItem.title = "快速公車"
            url = "http://data.ntpc.gov.tw/od/data/api/C37B06B7-8312-4891-B371-76152C82DA4F?$format=json"
        case "捷運先導":
            self.navigationItem.title = "捷運先導"
            url = "http://data.ntpc.gov.tw/od/data/api/08D41736-55CE-48DB-9727-9EF0FA74D8D1?$format=json"
        case "捷運線":
            self.navigationItem.title = "捷運線"
            url = "http://data.ntpc.gov.tw/od/data/api/0DB76DE2-071E-4E42-8E3F-7D548EB17092?$format=json"
        case "新巴士":
            self.navigationItem.title = "新巴士"
            url = "http://data.ntpc.gov.tw/od/data/api/072081AC-9969-4550-A868-9B1A204014F1?$format=json"
        case "跳蛙路線":
            self.navigationItem.title = "跳蛙路線"
            url = "http://data.ntpc.gov.tw/od/data/api/237BB413-6975-4EC4-9B13-29A6401669A8?$format=json"
        default:
            break
        }
        getJsonFromURL()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    struct Bus {
        let type : String
        let RouteName : String
        let startend : String
        let interval : String
        let startendtime : String
        let ticket: String
        let bufferarea : String
        
        init(dictionary : NSDictionary) {
            self.type = dictionary["type"] as! String
            self.RouteName = dictionary["RouteName"] as! String
            self.startend = dictionary["startend"] as! String
            self.interval = dictionary["interval"] as! String
            self.startendtime = dictionary["startendtime"] as! String
            self.ticket = dictionary["ticket"] as! String
            self.bufferarea = dictionary["bufferarea"] as! String
        }
    }
    
    var route: String? = nil
    
    func getJsonFromURL() {
        let url = URLRequest(url: URL(string: self.url)!)
        
        
        URLSession.shared.dataTask(with: url, completionHandler: {(data,response,error) -> Void in
    
    
            if let objectIndexes = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSArray {
                
                for objectIndex in objectIndexes {
                    //print((objectIndex as! NSDictionary).value(forKey: "RouteName") as! String)
                    self.busData.append((objectIndex as! NSDictionary).value(forKey: "RouteName") as! String)
                    //print("Showing \(self.busData.count) data")
                }
                OperationQueue.main.addOperation({
                    self.tableView.reloadData()
                    self.animateTable()
                })
            }
        }).resume()
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return busData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if busData.count == 0 {
        }else {
            cell.textLabel?.text = busData[indexPath.row]
        }
        return cell
    }
    
    
    func animateTable() {
        tableView.reloadData()
        let cells = tableView.visibleCells
        
        let tableViewHeight = tableView.bounds.size.height
        
        //iterate through each cell and moving it down a little
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        //perform in rach individual cell
        var delayCounter = 0
        for cell in cells {
            UIView.animate(withDuration: 1, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
        
    }
}
