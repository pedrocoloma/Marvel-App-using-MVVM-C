//
//  ComicsTabCoordinator.swift
//  MarvelFlutter
//
//  Created by Pedro Felipe Coloma de Araujo on 29/03/20.
//  Copyright © 2020 Pedro Felipe Coloma de Araujo. All rights reserved.
//

import UIKit

class ComicsTabCoordinator: AnyTabCoordinator {
    let vm: ComicsListViewModel
    let vc: ComicsListViewController
    
    var rootController: UINavigationController
    
   var tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "icons8-magazine-100"), selectedImage: #imageLiteral(resourceName: "icons8-magazine-100"))
    
    init() {
        
        vm = ComicsListViewModel()
        vc = ComicsListViewController(vm)

        rootController = UINavigationController(rootViewController: vc)
        rootController.tabBarItem = tabBarItem
        
        vm.coordinatorDelegate = self
    }
    
}

extension ComicsTabCoordinator: ComicsListViewModelCoorrdinatorDelegate {
    func didSelect(comic: Comic) {
        let heroesDetailsViewModel = ComicsDetailsViewModel(comic)
        let heroesDetailsViewController = ComicsDetailsViewController(heroesDetailsViewModel)
        rootController.pushViewController(heroesDetailsViewController, animated: true)
    }
}