//
//  ViewController.swift
//  tippy
//
//  Created by Ivy Chang on 9/17/16.
//  Copyright © 2016 Ivy Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var defaultTipField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    private static let defaults = UserDefaults.standard
    private static let builtTipPerc: [Double] = [0.15, 0.18, 0.2, 0.25]
    private static var useDefault: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onDefault(_ sender: AnyObject) {
        ViewController.useDefault = true
        tipControl.selectedSegmentIndex = -1
        calculateTip(defaultTipField)
    }
    
    @IBAction func onBuiltIn(_ sender: AnyObject) {
        ViewController.useDefault = false
        calculateTip(tipControl)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPerc = ((ViewController.useDefault) == true) ? (Double(defaultTipField.text!)!/100.0): ViewController.builtTipPerc[tipControl.selectedSegmentIndex]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPerc
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        defaultTipField.isUserInteractionEnabled = false;
        
        let customTip = ViewController.defaults.double(forKey: "defaultTip")
        defaultTipField.text = String(format: "%.2f", customTip)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
}

