//
//  ViewController.swift
//  RussianParkingAppPrototype
//
//  Created by Ilya Volkov on 06.09.2022.
//

import UIKit
import MapKit

protocol MapControllerProtocol: AnyObject {
    func presentSettingsModule()
}

class MapController: UIViewController, MapControllerProtocol {
    
    //MARK: - Global properties
    
    var presenter: MapPresenterProtocol?
    let mapModuleConfigurator: MapModuleConfiguratorProtocol = MapModuleConfigurator()
    
    //MARK: - Views
    
    private lazy var mapView: MKMapView = {
        let map = MKMapView()
        return map
    }()
    
    private lazy var settingsButton: UIButton = {
        let settingsButton = UIButton(type: .system)
        let icon = UIImage(systemName: "text.justify")
        let symbolSize = UIImage.SymbolConfiguration(pointSize: view.frame.width * 0.055)
        settingsButton.setImage(icon, for: .normal)
        settingsButton.setPreferredSymbolConfiguration(symbolSize, forImageIn: .normal)
        settingsButton.backgroundColor = UIColor(rgb: 0x67AD47)
        settingsButton.tintColor = .white
        settingsButton.layer.cornerRadius = view.frame.width * 0.055
        settingsButton.layer.masksToBounds = true
        settingsButton.addTarget(self, action: #selector(settingsButtonDidTap), for: .touchUpInside)
        return settingsButton
    }()
    
    private lazy var hStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 1
        stack.layer.cornerRadius = view.frame.width * 0.045
        stack.layer.masksToBounds = true
        return stack
    }()
    
    private lazy var accountButton: UIButton = {
        let button = UIButton(type: .system)
        let randomTitle = Int.random(in: 0...1000)
        button.setTitle("\(String(randomTitle)) ₽", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: view.frame.width * 0.05)
        button.backgroundColor = .white
        button.alpha = 0.9
        return button
    }()
    
    private lazy var topUpAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let icon = UIImage(systemName: "plus")
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: view.frame.width * 0.05)
        button.setImage(icon, for: .normal)
        button.tintColor = UIColor(rgb: 0x67AD47)
        button.backgroundColor = .white
        button.alpha = 0.9
        button.setPreferredSymbolConfiguration(symbolConfiguration, forImageIn: .normal)
        return button
    }()
    
    private lazy var searchButton = createButton(with: "magnifyingglass")
    
    private lazy var vStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 1
        stack.layer.cornerRadius = view.frame.width * 0.055
        stack.layer.masksToBounds = true
        return stack
    }()
    
    private lazy var bringCloserButton = createBringCloserAlienateButton(with: "plus")
    private lazy var alienateButton = createBringCloserAlienateButton(with: "minus")
    
    private lazy var locationButton = createButton(with: "location")
    
    private lazy var disablePersonButton: UIButton = {
        let button = UIButton(type: .system)
        let icon = UIImage(named: "disable.person")?.withRenderingMode(.alwaysOriginal)
        button.setImage(icon, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .white
        button.layer.cornerRadius = view.frame.width * 0.055
        button.layer.masksToBounds = true
        return button
    }()
    
    private lazy var addAutoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Добавить автомобиль", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: view.frame.width * 0.06)
        button.backgroundColor = UIColor(rgb: 0x3496CF)
        button.layer.cornerRadius = view.frame.width * 0.035
        button.layer.masksToBounds = true
        return button
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapModuleConfigurator.configure(with: self)
        
        setupHierarchy()
        setupLayout()
    }
    
    //MARK: - Settings
    
    private func setupHierarchy() {
        view.addSubview(mapView)
        mapView.addSubview(settingsButton)
        
        mapView.addSubview(hStackView)
        hStackView.addArrangedSubview(accountButton)
        hStackView.addArrangedSubview(topUpAccountButton)
        
        mapView.addSubview(searchButton)
        mapView.addSubview(vStackView)
        
        vStackView.addArrangedSubview(bringCloserButton)
        vStackView.addArrangedSubview(alienateButton)
        
        mapView.addSubview(locationButton)
        mapView.addSubview(disablePersonButton)
        mapView.addSubview(addAutoButton)
    }
    
    private func setupLayout() {
        
        let frame = view.frame
        
        mapView.frame = frame
        
        settingsButton.frame = CGRect(x: frame.width * 0.055,
                                      y: frame.height * 0.06,
                                      width: frame.width * 0.11,
                                      height: frame.width * 0.11)
        
        hStackView.frame = CGRect(x: frame.width / 2 - (frame.width * 0.33 / 2),
                                  y: frame.height * 0.06,
                                  width: frame.width * 0.33,
                                  height: frame.width * 0.11)
        
        searchButton.frame = CGRect(x: frame.width * 0.84,
                                    y: frame.height * 0.06,
                                    width: frame.width * 0.11,
                                    height: frame.width * 0.11)
        
        vStackView.frame = CGRect(x: frame.width * 0.84,
                                  y: frame.height * 0.25,
                                  width: frame.width * 0.11,
                                  height: frame.width * 0.22)
        
        locationButton.frame = CGRect(x: frame.width * 0.84,
                                      y: frame.height * 0.38,
                                      width: frame.width * 0.11,
                                      height: frame.width * 0.11)
        
        disablePersonButton.frame = CGRect(x: frame.width * 0.84,
                                           y: frame.height * 0.47,
                                           width: frame.width * 0.11,
                                           height: frame.width * 0.11)
        
        addAutoButton.frame = CGRect(x: frame.width * 0.03,
                                     y: frame.height * 0.86,
                                     width: frame.width * 0.939,
                                     height: frame.width * 0.15)
    }
    
    //MARK: - Functions
    
    private func createBringCloserAlienateButton(with image: String) -> UIButton {
        let button = UIButton(type: .system)
        let icon = UIImage(systemName: image)
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: view.frame.width * 0.05)
        button.setImage(icon, for: .normal)
        button.setPreferredSymbolConfiguration(symbolConfiguration, forImageIn: .normal)
        button.tintColor = .black
        button.backgroundColor = .white
        button.alpha = 0.9
        return button
    }
    
    private func createButton(with image: String) -> UIButton {
        let button = UIButton(type: .system)
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: view.frame.width * 0.05)
        let icon = UIImage(systemName: image)
        button.setImage(icon, for: .normal)
        button.setPreferredSymbolConfiguration(symbolConfiguration, forImageIn: .normal)
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.cornerRadius = view.frame.width * 0.055
        button.alpha = 0.9
        return button
    }
    
    //MARK: - MapControllerProtocol methods
    
    func presentSettingsModule() {
        let nav = UINavigationController(rootViewController: SettingsController())
        present(nav, animated: true)
    }
    
    //MARK: - Actions
    
    @objc private func settingsButtonDidTap() {
        presenter?.handleSettingsButton()
    }
}

