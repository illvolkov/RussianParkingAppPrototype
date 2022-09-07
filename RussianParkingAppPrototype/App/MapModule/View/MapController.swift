//
//  ViewController.swift
//  RussianParkingAppPrototype
//
//  Created by Ilya Volkov on 06.09.2022.
//

import UIKit

protocol MapControllerProtocol: AnyObject {
    
}

class MapController: UIViewController, MapControllerProtocol {
    
    //MARK: - Global properties
    
    var presenter: MapPresenterProtocol?
    let mapModuleConfigurator: MapModuleConfiguratorProtocol = MapModuleConfigurator()
    
    //MARK: - Views
    
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapModuleConfigurator.configure(with: self)
        
        setupHierarchy()
        setupLayout()
    }
    
    //MARK: - Settings
    
    private func setupHierarchy() {
        
    }
    
    private func setupLayout() {
        
    }
}

