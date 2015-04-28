//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
//  AppDelegate.swift
//  appinvites
import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  // [START didfinishlaunching]
  func application(application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
      GHIContext.sharedInstance().configure()
      // Initialize sign-in
      GIDSignIn.sharedInstance().scopes = ["https://www.googleapis.com/auth/plus.login"]
      GPPInvite.applicationDidFinishLaunching()
      return true
  }
  // [END didfinishlaunching]

  // [START openurl]
  func application(application: UIApplication,
    openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
      let invite = GPPInvite.handleURL(url, sourceApplication:sourceApplication, annotation:annotation)
      if (invite != nil) {
        println("Invite received from: \(sourceApplication) Deeplink: \(invite.deepLink), Id: \(invite.inviteId)")
        return true
      }

      return GIDSignIn.sharedInstance().handleURL(url, sourceApplication: sourceApplication, annotation: annotation)
  }
  // [END openurl]
}

