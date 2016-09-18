//
//  SettingsViewController.swift
//  tippy
//
//  Created by Ivy Chang on 9/17/16.
//  Copyright © 2016 Ivy Chang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipField: UITextField!
    
    private static let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func onSave(_ sender: AnyObject) {
        SettingsViewController.defaults.set(Double(defaultTipField.text!) ?? 0.0, forKey: "defaultTip")
        SettingsViewController.defaults.synchronize()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        defaultTipField.text = String(format: "%.2f", SettingsViewController.defaults.double(forKey: "defaultTip"))
    }
}
