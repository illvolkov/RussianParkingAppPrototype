//
//  MapRouter.swift
//  RussianParkingAppPrototype
//
//  Created by Ilya Volkov on 07.09.2022.
//

protocol MapRouterProtocol: AnyObject {
    
}

class MapRouter: MapRouterProtocol {
    weak var viewController: MapControllerProtocol?
    
    init(viewController: MapControllerProtocol) {
        self.viewController = viewController
    }
}
