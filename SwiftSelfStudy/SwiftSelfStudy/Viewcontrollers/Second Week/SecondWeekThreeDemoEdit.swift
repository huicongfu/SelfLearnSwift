//
//  SecondWeekThreeDemoEdit.swift
//  SwiftSelfStudy
//
//  Created by fu on 2017/10/29.
//  Copyright © 2017年 fhc. All rights reserved.
//

import UIKit

typealias EditTodoType = (SecondWeekThirdDemoModel) -> Void

class SecondWeekThreeDemoEdit: UIViewController,UITextFieldDelegate {

    @IBOutlet var peopleBtn: UIButton!
    @IBOutlet var phoneBtn: UIButton!
    @IBOutlet var shoppingCart: UIButton!
    @IBOutlet var airplane: UIButton!
    @IBOutlet var inputTF: UITextField!
    @IBOutlet var currentDP: UIDatePicker!
    
    var selectedBtn:UIButton!
    var model:SecondWeekThirdDemoModel!
    
    var editModel:EditTodoType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createUI()
        
    }
    
    func createUI() {
        
        inputTF.delegate = self
        
        peopleBtn.clipsToBounds = true
        peopleBtn.layer.cornerRadius = 30.0
        peopleBtn.tag = 500
        peopleBtn.addTarget(self, action: #selector(typeBtnClick(btn:)), for: .touchUpInside)
        
        phoneBtn.clipsToBounds = true
        phoneBtn.layer.cornerRadius = 30.0
        phoneBtn.tag = 501
        phoneBtn.addTarget(self, action: #selector(typeBtnClick(btn:)), for: .touchUpInside)
        
        shoppingCart.clipsToBounds = true
        shoppingCart.layer.cornerRadius = 30.0
        shoppingCart.tag = 502
        shoppingCart.addTarget(self, action: #selector(typeBtnClick(btn:)), for: .touchUpInside)
        
        airplane.clipsToBounds = true
        airplane.layer.cornerRadius = 30.0
        airplane.tag = 503
        airplane.addTarget(self, action: #selector(typeBtnClick(btn:)), for: .touchUpInside)
        
        if (model != nil) {
            
            self.inputTF.text = model.titleStr
            
            let formatter = DateFormatter.init()
            formatter.dateFormat = "yyyy-MM-dd"
            self.currentDP.date = formatter.date(from: model.timeStr)!
            
            switch model.type {
            case .ListTypePeople:
                self.peopleBtn.isSelected = true
                self.selectedBtn = self.peopleBtn
                break
            case .ListTypePhone:
                self.phoneBtn.isSelected = true
                self.selectedBtn = self.phoneBtn
                break
            case .ListTypeShpping:
                self.shoppingCart.isSelected = true
                self.selectedBtn = self.shoppingCart
                break
            case .ListTypeAirplane:
                self.airplane.isSelected = true
                self.selectedBtn = self.airplane
                break
            }
        }else {
            self.model = SecondWeekThirdDemoModel.init()
            self.peopleBtn.isSelected = true
            self.selectedBtn = self.peopleBtn
        }
        
    }
   
    // MARK: - 事件类型
    func typeBtnClick(btn:UIButton) {
        btn.isSelected = true
        self.selectedBtn.isSelected = false
        self.selectedBtn = btn
    }
    
    // MARK: - 确定
    @IBAction func doneClick(_ sender: UIButton) {
        self.view.endEditing(true)
        
        model.type = ListType(rawValue: self.selectedBtn.tag - 500)!
        let formatter = DateFormatter.init()
        formatter.dateFormat = "yyyy-MM-dd"
        model.timeStr = formatter.string(from: self.currentDP.date)
        
        if model.titleStr.characters.count <= 0 {
            let alert = UIAlertController.init(title: "to do list not nil", message: "", preferredStyle: .alert)
            let cancelBtn = UIAlertAction.init(title: "ok", style: .cancel, handler: nil)
            alert.addAction(cancelBtn)
            self.navigationController?.present(alert, animated: true, completion: nil)
            return
        }
        
        if self.editModel != nil {
            self.editModel!(self.model)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.model.titleStr = textField.text!
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
