//
//  LoginUI.swift
//  Patchloader
//
//  Created by Ashmika Gujaarthi on 15/02/21.
//

import UIKit

open class LoginUI: UIViewController {

    @IBOutlet weak var viewLogin: UIView!
    @IBOutlet weak var btnPasswordShowHide: UIButton!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    open override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLoginClick(_ sender: UIButton) {
        
    }
    
    @objc open func test() {
        print("text")
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
