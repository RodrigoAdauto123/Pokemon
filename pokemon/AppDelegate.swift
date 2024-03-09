//
//  AppDelegate.swift
//  pokemon
//
//  Created by Rodrigo Adauto Ortiz on 14/07/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UIWindowSceneDelegate {

//    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        window = UIWindow(frame: UIScreen.main.bounds)
//        
//        let storyboard = UIStoryboard(name: "HomePokemon", bundle: nil)
//        guard let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomePokemonViewController") as? HomePokemonViewController else {return false}
//        let presenterViewController = HomePokemonPresenter()
//        let routerViewController = HomePokemonRouter(coordinator: homeViewController)
//        homeViewController.presenter = presenterViewController
//        presenterViewController.router = routerViewController
//        
//        
//        let rootViewController = homeViewController
//        let navigationController = UINavigationController(rootViewController: rootViewController)
//        window?.rootViewController = navigationController
//        window?.makeKeyAndVisible()
        ListPokemonTransformer.register()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

