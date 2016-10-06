//
//  AppDependencies.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import UIKit

class AppDependencies {
    
    var listWireframe = ListWireframe()
    
    let flickerFactory = FlickerFactory()
    
    init() {
        configureDependencies()
    }
    
    func installRootViewControllerIntoWindow(_ window: UIWindow) {
        listWireframe.presentListInterfaceFromWindow(window)
    }
    
    func configureDependencies() {
        let rootWireframe = RootWireframe()
//
        let listPresenter = ListPresenter()
        let listInteractor = ListInteractor(flickergateway: flickerFactory)
//
        let filterWireframe = FilterWireframe()
        let filterInteractor = FilterInteractor(flickerGateway: flickerFactory)
        let filterPresenter = FilterPresenter()
//
//        let detailsWireframe = DetailsWireframe()
//        let detailsInteractor = DetailsInteractor(marvelgateway: marvelFactory)
//        let detailsPresenter = DetailsPresenter()
        
        /* List Module configurations */
        
        
        
        listInteractor.output = listPresenter
        
        listPresenter.listInteractor = listInteractor
        listPresenter.listWireframe = listWireframe
        
        listWireframe.filterWireframe = filterWireframe
        listWireframe.listPresenter = listPresenter
        listWireframe.rootWireframe = rootWireframe
//        listWireframe.detailsWireframe = detailsWireframe
        
        /* Filter Module configurations */
        
        filterInteractor.output = filterPresenter
        
        filterWireframe.filterPresenter = filterPresenter
//        filterWireframe.detailsWireframe = detailsWireframe
        
        filterPresenter.filterWireframe = filterWireframe
        filterPresenter.filterInteractor = filterInteractor
        /*
        /* Details Module configurations */
        
        detailsInteractor.output = detailsPresenter
        
        detailsWireframe.detailsPresenter = detailsPresenter
        
        detailsPresenter.detailsInteractor = detailsInteractor
        detailsPresenter.detialsWireframe = detailsWireframe
 */
        
        
    }
}
