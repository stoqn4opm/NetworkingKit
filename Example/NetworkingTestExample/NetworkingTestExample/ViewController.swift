//
//  ViewController.swift
//  NetworkingTestExample
//
//  Created by Stoyan Stoyanov on 30/05/2019.
//  Copyright © 2019 Stoyan Stoyanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func postButtonTapped(_ sender: Any) {
        
        let request = SamplePost.Request(info: SamplePost.Info(name: "TestName", schema: "testScheme", infoDescription: "TestDescription"),
                                         item: [
                                            SamplePost.Item(name: "TestItem1",
                                                            request: SamplePost.RequestClass(url: "testURL",
                                                                                             method: "TestMethod",
                                                                                             header: [
                                                                                                SamplePost.Header(key: "testHEader", value: "TestValue")],
                                                                                             body: SamplePost.Body(mode: "testMode", raw: "testRaw")))])
        
        SamplePost.Call(withRequestData: request) { (result, error) in
            print("result: \(String(describing: result))")
            print("error: \(String(describing: error))")
        }
    }
    
    @IBAction func getButtonTapped(_ sender: Any) {
        
        SampleGet.Call { (result, error) in
            print("result: \(String(describing: result))")
            print("error: \(String(describing: error))")
        }
    }
}
