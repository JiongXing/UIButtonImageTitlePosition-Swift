//
//  ViewController.swift
//  UIButtonImageTitlePositionDemo
//
//  Created by JiongXing on 2017/2/22.
//  Copyright © 2017年 JiongXing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftTopButton: UIButton!
    @IBOutlet weak var rightTopButton: UIButton!
    @IBOutlet weak var leftBottomButton: UIButton!
    @IBOutlet weak var rightBottomButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBorderForButton(leftTopButton)
        addBorderForButton(rightTopButton)
        addBorderForButton(leftBottomButton)
        addBorderForButton(rightBottomButton)
        
        leftTopButton.adjustImage(position: .left, spacing: 10)
        rightTopButton.adjustImage(position: .right, spacing: 10)
        leftBottomButton.adjustImage(position: .top, spacing: 10)
        rightBottomButton.adjustImage(position: .bottom, spacing: 10)
    }
    
    func addBorderForButton(_ button: UIButton) {
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

