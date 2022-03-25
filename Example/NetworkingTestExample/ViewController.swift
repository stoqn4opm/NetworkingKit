//
//  ViewController.swift
//  NetworkingTestExample
//
//  Created by Stoyan Stoyanov on 30/05/2019.
//  Copyright © 2019 Stoyan Stoyanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var page = 1

    @IBAction func postButtonTapped(_ sender: Any) {
        
        // don't look at the bad formatting of request,
        // pay attention to how `request` constant is used.
        
        let request =
            SamplePost.Request(
                info: SamplePost.Info(name: "TestName", schema: "testScheme", infoDescription: "TestDescription"),
                item: [
                    SamplePost.Item(name: "TestItem1",
                                    request: SamplePost.RequestClass(
                                        url: "testURL",
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
        
        GalleryEndpoint(inTimeWindow: .all, page: page, appClientId: "ef8d4acb74c28c0") { result, error in
            print("result: \(String(describing: result))")
            print("error: \(String(describing: error))")
        }
        
        GallerySearchEndpoint(searchQuery: "cat", inTimeWindow: .all, page: page, appClientId: "ef8d4acb74c28c0") { result, error in
            print("result: \(String(describing: result))")
            print("error: \(String(describing: error))")
        }
        
        page += 1
//        
//        SampleGet.Call { (result, error) in
//            print("result: \(String(describing: result))")
//            print("error: \(String(describing: error))")
//        }
    }
}
