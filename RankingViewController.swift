//
//  RankingViewController.swift
//  BarabaraGame
//
//  Created by 神原良継 on 2019/04/12.
//  Copyright © 2019 YoshitsuguKambara. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController {

    @IBOutlet var rankingLable1: UILabel!   //1位のスコアを表示させるラベル
    @IBOutlet var rankingLabel2: UILabel!   //2位のスコアを表示させるラベル
    @IBOutlet var rankingLabel3: UILabel!   //3位のスコアを表示させるラベル
    
    let defaults: UserDefaults = UserDefaults.standard  //scoreの保存をするための変数
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rankingLable1.text = String(defaults.integer(forKey: "score1"))
        rankingLabel2.text = String(defaults.integer(forKey: "score2"))
        rankingLabel3.text = String(defaults.integer(forKey: "score3"))
        // Do any additional setup after loading the view.
    }
    
    @IBAction func toTop() {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
