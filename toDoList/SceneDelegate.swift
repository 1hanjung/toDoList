//
//  SceneDelegate.swift
//  toDoList
//
//  Created by 정일한 on 2023/08/30.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: windowScene)
        
        let todoListViewController = ViewController()
        let navigationController = UINavigationController(rootViewController: todoListViewController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
       
    }
}
