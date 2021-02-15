//
//  PatchUI.swift
//  Patchloader
//
//  Created by Ashmika Gujaarthi on 05/11/20.
//

import UIKit

 open class PatchUI: UIViewController {
var playtestName = String()
    var gameTimer: Timer?
    var isValid = Bool()
    open override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc open func test() {
        print("Test")
        isValid = true
       // gameTimer = Timer.scheduledTimer(timeInterval: 120, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
        self.APICall()
       
    }
    
    func APICall() {
        let bundleIdentifier =  Bundle.main.bundleIdentifier

        let params = ["appPackageName":String(describing: "com.globalstep.pocketcity")] as Dictionary<String, String>
        
        
        var request = URLRequest(url: URL(string: "http://52.90.174.9:83/api/PlayTest/getValidAppPackage")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                print(json)
                let d = json["d"] as! Int
                if d == 1 {
                    print("1")
                    DispatchQueue.main.async {
                        self.setupViewsForLogin()
                        self.hijackAppWindow()
                    }
                } else {
                    print("0")
                    DispatchQueue.main.async {
                        self.setupViewsForLoading()
                        self.hijackAppWindow()
                    }
                    
                }
               
            } catch {
                print("error")
            }
        })

        task.resume()
    }
    
    @objc func runTimedCode() {
            self.setupViewsForLoading()
            self.hijackAppWindow()
    }
    
    
    
    fileprivate func removeDisplayLabel(){
        guard let delegate = UIApplication.shared.delegate else{
            return
        }
        guard let window = delegate.window else {
            return
        }
        for hijackingView in hijackingSubviews {
            if let existingHijackView = window?.viewWithTag(hijackingView.tag) {
                existingHijackView.removeFromSuperview()
            }
            window?.willRemoveSubview(hijackingView)
        }
        
    }
    
    var hijackingSubviews = [UIView]()
    
    fileprivate func setupViewsForLogin(){
        guard let delegate = UIApplication.shared.delegate else{
            return
        }
        guard let window = delegate.window else {
            return
        }
        let uiview :LoginView?

        uiview = Bundle.main.loadNibNamed("LoginView", owner: self, options: nil)?[0] as? LoginView
        self.hijackingSubviews.append(uiview!)
        
    }
    
    
    fileprivate func setupViewsForLoading(){
        guard let delegate = UIApplication.shared.delegate else{
            return
        }
        guard let window = delegate.window else {
            return
        }
        
        let label = UILabel(frame: CGRect(x: 0,y: 0, width: window!.frame.size.width, height: window!.frame.size.height))
        let bundleIdentifier =  Bundle.main.bundleIdentifier
        var message = String()
        message = "Playtest validity is over!! for \(String(describing: bundleIdentifier))"
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.text = message
        label.numberOfLines =  3
        label.backgroundColor = UIColor(red: 0, green: 1, blue: 1, alpha: 1)
        let alert = UIAlertController(title: "GSPlayTest", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        self.hijackingSubviews.append(label)
       
    }
    
    
    
    
    @objc open func hijackAppWindow(){
        print("Test")
        for _:Int in 0...20 {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.displayDisplayLabel()
            }
        }
    }
    
    fileprivate func displayDisplayLabel(){
        guard let delegate = UIApplication.shared.delegate else{
            return
        }
        guard let window = delegate.window else {
            return
        }
        for hijackingView in hijackingSubviews {
            if let existingHijackView = window?.viewWithTag(hijackingView.tag) {
                existingHijackView.removeFromSuperview()
            }
            window?.addSubview(hijackingView)
        }
        
    }
    
    private func imageFromColor(size: CGSize, color: UIColor) -> UIImage{
        UIGraphicsBeginImageContext(CGSize(width: size.width, height: size.height))
        
        UIBezierPath.init(roundedRect: CGRect(x: 0, y: 0, width: size.width, height: size.height), cornerRadius: 3).addClip()
        
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return colorImage!;
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
