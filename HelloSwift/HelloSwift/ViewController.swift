//
//  ViewController.swift
//  HelloSwift
//
//  Created by Wei Li on 07/08/2014.
//  Copyright (c) 2014 FeedHenry. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var helloButton: UIButton!
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func onClick(sender: AnyObject) {
        let args = ["hello":"world"]
        let successCallback:(AnyObject!) -> Void = {res in
            if let successRes = res as? FHResponse {
                if let parsedRes = successRes.parsedResponse as? [String:String] {
                    self.result.text = parsedRes["msg"]
                }
            }
        }
        let errorCallback: (AnyObject!) -> Void = {res in
            if let errorRes = res as? FHResponse {
                println("FH cloud call failed. Error = \(errorRes.rawResponseAsString)")
            }
        }
        FH.performCloudRequest("hello", withMethod: "POST", andHeaders: nil, andArgs: args, andSuccess: successCallback, andFailure: errorCallback)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("view did load")
        helloButton.enabled = false
        // Do any additional setup after loading the view, typically from a nib.
        let successCallback:(AnyObject!) -> Void = {res in
            println("FH init succeeded")
            self.helloButton.enabled = true
        }
        let errorCallback: (AnyObject!) -> Void = {res in
            if let errorRes = res as? FHResponse {
                println("FH init failed. Error = \(errorRes.rawResponseAsString)")
            }
        }
        FH.initWithSuccess(successCallback, andFailure: errorCallback)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

