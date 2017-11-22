//
//  WelcomeViewController.swift
//  新北公車通
//
//  Created by 林松賢 on 2017/11/19.
//  Copyright © 2017年 Steven. All rights reserved.
//

import UIKit
import PaperOnboarding

class WelcomeViewController: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate {
    @IBOutlet weak var onBoardingView: OnboardingView!
    @IBOutlet weak var getStartedButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        onBoardingView.dataSource = self
        onBoardingView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        let backgroundColorOne = UIColor(red: 217/255, green: 72/255, blue: 89/255, alpha: 1)
        let backgroundColorTwo = UIColor(red: 106/255, green: 166/255, blue: 211/255, alpha: 1)
        let backgroundColorThree = UIColor(red: 168/255, green: 200/255, blue: 78/255, alpha: 1)
        
        let titleFont = UIFont(name: "AvenirNext-Bold", size: 24)!
        let descriptionFont = UIFont(name: "AvenirNext-Regular", size: 18)!
        
        return [
            (UIImage(named: "rocket")!, "效率，快、狠、準！", "為iOS裝置進行優化，讓使用體驗更上一層樓。", UIImage(named: "rocket")!, backgroundColorOne, UIColor.white, UIColor.white, titleFont, descriptionFont),
            (UIImage(named: "notification")!, "隨時掌握最新消息", "開啟通知提醒，資料一手掌握不間斷。", UIImage(named: "notification")!, backgroundColorTwo, UIColor.white, UIColor.white, titleFont, descriptionFont),
            (UIImage(named: "brush")!, "換介面，換心情！", "App提供使用者多種客製化介面，舒適閱讀不求人！", UIImage(named: "brush")!, backgroundColorThree, UIColor.white, UIColor.white, titleFont, descriptionFont)
            ][index]
    }
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index == 1 {
            UIView.animate(withDuration: 0.2, animations: {
                self.getStartedButton.alpha = 0.0
            })
        }
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 2 {
            UIView.animate(withDuration: 1.0, animations: {
                self.getStartedButton.alpha = 1.0
            })
        }
    }

}
