//
//  GameViewController.swift
//  BarabaraGame
//
//  Created by 神原良継 on 2019/04/12.
//  Copyright © 2019 YoshitsuguKambara. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var imgView1: UIImageView!    //上の画像
    @IBOutlet var imgView2: UIImageView!    //真ん中の画像
    @IBOutlet var imgView3: UIImageView!    //下の画像
    
    @IBOutlet var resultLabel: UILabel!     //スコアを表示するラベル
    
    var timer: Timer!   //画像を動かすためのタイマー(timeという変数に時間が随時打ち込まれる)
    var score: Int = 1000   //スコアの値
    let defaults: UserDefaults = UserDefaults.standard  //スコアの保存をするための変数
    /*
     値の保存をするときにUserDefaultsを使用する。ここに保存された値はアプリを閉じても保存される
     */
    
    let width: CGFloat = UIScreen.main.bounds.size.width     //画面幅(UIScreen.main.bounds.size.widthでiPhoneの画面サイズを取得する)
    
    var positionX: [CGFloat] = [0.0, 0.0, 0.0]  //画像の位置の配列
    
    var dx: [CGFloat] = [1.0, 0.5, -1.0]    //画像の動かす幅の配列
    
    func start() {
        //結果ラベルを見えなくする
        resultLabel.isHidden = true
        //タイマーを動かす
        timer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        positionX = [width/2, width/2, width/2] //画像の位置を画面幅の中心にする
        self.start()    //32行目のstartというメソッドを呼び出す
    }
    
    @objc func up() {
        for i in 0..<3 {
            //端に来たら動かす向きを逆にする
            if positionX[i] > width || positionX[i] < 0 {
                dx[i] = dx[i] * (-1)
            }
            positionX[i] += dx[i]   //画像の位置をdx分ずらす
        }
        imgView1.center.x = positionX[0]    //上の画像をずらした位置に移動させる
        imgView2.center.x = positionX[1]    //真ん中の画像をずらした位置に移動させる
        imgView3.center.x = positionX[2]    //下の画像をずらした位置に移動させる
        
    }
    
    //ストップボタンを押したとき
    @IBAction func stop() {
        if timer.isValid == true {
            timer.invalidate()
        }
        for i in 0..<3 {
            score = score - abs(Int(width/2 - positionX[i]))*2  //スコアの計算をする
        }
        resultLabel.text = "Score: " + String(score)    //結果ラベルにスコアを表示する
        resultLabel.isHighlighted = false   //結果ラベルを隠さない(現す)
    }
    
    @IBAction func retry() {
        score = 1000    //スコアの値をリセットする
        positionX = [width/2, width/2, width/2]     //画像の位置を真ん中に戻す
        if timer.isValid == false {
            self.start()    //スタートメソッドを呼び出す
        }
    }
    
    @IBAction func toTop() {
        self.dismiss(animated: true, completion: nil)
    }

}
