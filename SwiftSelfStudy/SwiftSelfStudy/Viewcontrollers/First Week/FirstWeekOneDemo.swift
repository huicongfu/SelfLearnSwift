//
//  FirstWeekOneDemo.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/10/15.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

class FirstWeekOneDemo: UIViewController {

    @IBOutlet var inputTF: UITextField!
    
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    
    @IBOutlet var totalNumLabel: UILabel!
    
    @IBOutlet var mySlider: UISlider!
    
    var toolBar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initialize()
        
    }

    func initialize () {
        toolBar = UIToolbar.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: 35))
        let sureBtn = UIBarButtonItem(title: "完成", style: .plain, target: self, action: #selector(doneNum))
        let spaceBtn = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.items = [spaceBtn ,sureBtn]
        
        mySlider.addTarget(self, action:#selector(changeLabelValued(slider:)) , for: UIControlEvents.valueChanged)
        
        inputTF.inputAccessoryView = toolBar
    }
    
    // MARK - slider
    func changeLabelValued (slider:UISlider) {
        let count = slider.value
        
        if ((inputTF.text?.characters.count)! > 0) {
            let value = Float(inputTF.text!)
            let tipV = value! * count
            
            countLabel.text = String(format:"%.2f",tipV)
            tipLabel.text = String.init(format: "Tip(%.2f)", count)
            totalNumLabel.text = String.init(format: "%.2f", value! + tipV)
        }
        
    }
    
    func doneNum () {
        self.view.endEditing(false)
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
