//
//  MenuPageViewController.swift
//  新北公車通
//
//  Created by 林松賢 on 2017/11/26.
//  Copyright © 2017年 Steven. All rights reserved.
//

import UIKit

class MenuPageViewController: UIViewController {
    @IBOutlet weak var standardRoute: UIButton!
    @IBOutlet weak var rapidBusRoute: UIButton!
    @IBOutlet weak var mrtFirstRoute: UIButton!
    @IBOutlet weak var mrtRoute: UIButton!
    @IBOutlet weak var newBusRoute: UIButton!
    @IBOutlet weak var jumpBusRoute: UIButton!
    
    var labelText: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()


        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func selectRouteButton(_ sender: UIButton) {
        let buttonText = sender.titleLabel?.text!
        labelText = buttonText!
        performSegue(withIdentifier: "tableViewControllerSegue", sender: self)
    }

    let nextScene = UIViewController()
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tableViewControllerSegue" {
            let nextScene = segue.destination as! UINavigationController
            let passData = self.labelText
            let targetController = nextScene.topViewController as! TableViewController
            targetController.incomingRouteTitle = passData
        }
    }
    
    

}
