//
//  MapRouter.swift
//  RussianParkingAppPrototype
//
//  Created by Ilya Volkov on 07.09.2022.
//

protocol MapRouterProtocol: AnyObject {
    func goToSettingsModule()
}

class MapRouter: MapRouterProtocol {
    
    //MARK: - Global properties
    
    weak var viewController: MapControllerProtocol?
    
    //MARK: - Initial
    
    init(viewController: MapControllerProtocol) {
        self.viewController = viewController
    }
    
    //MARK: - MapRouterProtocol methods
    
    func goToSettingsModule() {
        viewController?.presentSettingsModule()
    }
}
