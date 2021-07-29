//
//  TestScreentimeAPIApp.swift
//  TestScreentimeAPI
//
//  Created by Yazan Halawa on 7/27/21.
//

import SwiftUI
import FamilyControls

@main
struct TestScreentimeAPIApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        AuthorizationCenter.shared.requestAuthorization { result in
            switch result {
            case .success:
                break
            case .failure(let error):
                print("error for screentime is \(error)")
            }
        }

        _ = AuthorizationCenter.shared.$authorizationStatus
            .sink() {_ in
            switch AuthorizationCenter.shared.authorizationStatus {
            case .notDetermined:
                print("not determined")
            case .denied:
                print("denied")
            case .approved:
                print("approved")
            @unknown default:
                break
            }
        }
        return true
    }
}
