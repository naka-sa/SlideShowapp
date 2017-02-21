//
//  NextViewController.swift
//  Sildeshowapp
//
//  Created by satoshi_nakajima on 2017/02/17.
//  Copyright © 2017年 satoshi_nakajima. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var Imageview: UIImageView!
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Imageview.image = image
        Imageview.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
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
