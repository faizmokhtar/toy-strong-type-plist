//
//  ViewController.swift
//  toy-strong-type-plist
//
//  Created by Faiz Mokhtar on 05/05/2018.
//  Copyright © 2018 Faiz Mokhtar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            let appList = try PlistFile<InfoPlist>()

            guard let url = appList.data.configuration.url else { fatalError("Invalid URL specified") }
            let environment = appList.data.configuration.environment

            print("url: \(String(describing: url))")
            print("environment: \(environment)")
        } catch let err {
            print("Failed to parse data: \(err)")
        }
    }
}

