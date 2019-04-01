//
//  ViewController.swift
//  Swift5FirebaseBasic
//
//  Created by seijiro on 2019/03/31.
//  Copyright © 2019 norainu. All rights reserved.
//

import UIKit
import LineSDK

class ViewController: UIViewController,LineSDKLoginDelegate {

  var name = String()
  var pictureURL = String()
  var pictureURLString = String()

  func didLogin(_ login: LineSDKLogin, credential: LineSDKCredential?, profile: LineSDKProfile?, error: Error?) {
    if let displayName = profile?.displayName {
      self.name = displayName
    }
    if let pictureURL = profile?.pictureURL {
      self.pictureURLString = pictureURL.absoluteString
    }
    UserDefaults.standard.set(self.name,forKey: "displayName")
    UserDefaults.standard.set(self.pictureURLString,forKey: "pictureURLString")
    performSegue(withIdentifier: "next", sender: nil)

  }

  override func viewDidLoad() {
    super.viewDidLoad()
    LineSDKLogin.sharedInstance().delegate = self

  }

  @IBAction func login(_ sender: Any) {
    LineSDKLogin.sharedInstance().start()
  }

}

