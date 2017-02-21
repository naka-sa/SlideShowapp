//
//  ViewController.swift
//  Sildeshowapp
//
//  Created by satoshi_nakajima on 2017/02/17.
//  Copyright © 2017年 satoshi_nakajima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var ReturnButton: UIButton!
    @IBOutlet weak var MoveButton: UIButton!
    @IBOutlet weak var AutoButton: UIButton!
    
    var timer: Timer?
    var ImageNo = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "food_gyuukatsu")
        ImageView.image = image
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のNextViewControllerを取得する
        let NextViewController:NextViewController = segue.destination as! NextViewController
        NextViewController.image = ImageView.image
        //自動再生中に画像をタップした場合はtimerを破棄する
        timer?.invalidate()
        timer = nil
        MoveButton.isEnabled = true
        ReturnButton.isEnabled = true
        AutoButton.setTitle("自動再生", for:UIControlState.normal)
    }
    
    
    func displayImage() {
        
        // 画像の名前の配列
        let imageNameArray = [
            "food_gyuukatsu",
            "food_onion_gratin_soup",
            "food_ramen_iekei",
            "food_shrimp_cocktail"
        ]
        // 画像の番号が正常な範囲を指しているかチェック
        
        // 範囲より下を指している場合、最後の画像を表示
        if ImageNo < 0 {
            ImageNo = 3
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if ImageNo > 3 {
            ImageNo = 0
        }
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[ImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        ImageView.image = image
    }

    func update(timer: Timer) {
        //表示している画像の番号を1増やす
        ImageNo += 1
        displayImage()
    }
    
    @IBAction func ImageJump(_ sender: Any) {
    }
    
    
    @IBAction func MoveButton(_ sender: Any) {
        //画像を次におくって表示
        ImageNo += 1
        displayImage()
    }

    @IBAction func ReturnButton(_ sender: Any) {
        //画像を戻して表示
        ImageNo -= 1
        displayImage()
    }
    
    @IBAction func AutoButton(_ sender: Any) {
        //Buttonの表示を変更する
        AutoButton.setTitle("停止", for:UIControlState.normal)
        //Timerを設定（2秒毎に画像を切り替え）
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.update(timer:)), userInfo: nil, repeats: true)
            //進むと戻るをタップ不可にする
            MoveButton.isEnabled = false
            ReturnButton.isEnabled = false
        }
        else{
            //timerを破棄する
            self.timer?.invalidate()
            self.timer = nil
            //Buttonの表示を変更する
            AutoButton.setTitle("自動再生", for:UIControlState.normal)
            //進むと戻るをタップ可能にする
            MoveButton.isEnabled = true
            ReturnButton.isEnabled = true
        }
        
    }
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
    
}

