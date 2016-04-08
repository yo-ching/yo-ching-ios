//
//  WrexegramViewController.swift
//  YoChing
//
//  Created by Juan Wellington Moreno on 11/11/15.
//  Copyright © 2015 Gary.com. All rights reserved.
//

import Foundation
import UIKit

class WrexagramViewController : UIViewController {
    
    @IBOutlet weak var navTitle: UILabel!
    @IBOutlet weak var wrexegramImage: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var webView: UIWebView!
    
    var wrexagramNumber: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if wrexagramNumber < 0 {
            self.parentViewController?.dismissViewControllerAnimated(true, completion: nil)
            return
        }
        
        navTitle.text = "Wrexagram \(wrexagramNumber)"
        
        let formattedOutcome = String(format: "%02d", wrexagramNumber)
        let filename = "wrex\(formattedOutcome)"
        
        if let image = UIImage(named: filename) {
            wrexegramImage.image = image
        }
                
        if let html = NSBundle.mainBundle().pathForResource(filename, ofType: "html") {
            do {
                let htmlString = try String(contentsOfFile: html, encoding: NSUTF8StringEncoding)
                webView.loadHTMLString(htmlString, baseURL : NSURL.fileURLWithPath(NSBundle.mainBundle().bundlePath))
            } catch {
                
            }
        }
    }
    
}