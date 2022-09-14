//
//  MapInteractor.swift
//  RussianParkingAppPrototype
//
//  Created by Ilya Volkov on 07.09.2022.
//

protocol MapInteractorProtocol: AnyObject {
    
}

class MapInteractor: MapInteractorProtocol {
    
    //MARK: - Global properties
    
    weak var presenter: MapPresenterProtocol?
    
    //MARK: - Initial
    
    init(presenter: MapPresenterProtocol) {
        self.presenter = presenter
    }
}
