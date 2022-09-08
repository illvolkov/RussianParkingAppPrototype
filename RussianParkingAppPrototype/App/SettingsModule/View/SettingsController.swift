//
//  SettingsController.swift
//  RussianParkingAppPrototype
//
//  Created by Ilya Volkov on 07.09.2022.
//

import UIKit

protocol SettingsControllerProtocol: AnyObject {
    func configure(data: [SettingSection])
    func dismissModule()
}

class SettingsController: UIViewController, SettingsControllerProtocol {
    
    //MARK: - Global properties
    
    var presenter: SettingsPresenterProtocol?
    let configurator: SettingsModuleConfiguratorProtocol = SettingsModuleConfigurator()
    
    //MARK: - Private properties
    
    private var settings = [SettingSection]()
    
    //MARK: - Views
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: .grouped)
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
        
        presenter?.configureView()
        setupHierarchy()
        setupView()
        setupNavigationBar()
    }
    
    //MARK: - Settings
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupView() {
        title = "Парковки России"
    }
    
    private func setupNavigationBar() {
        let button = UIBarButtonItem(title: "Закрыть", style: .done, target: self, action: #selector(closeButtonDidTap))
        button.tintColor = UIColor(rgb: 0x2F8AC4)
        navigationItem.leftBarButtonItem = button
    }
    
    //MARK: - SettingsControllerProtocol methods
    
    func configure(data: [SettingSection]) {
        self.settings = data
    }
    
    func dismissModule() {
        dismiss(animated: true)
    }
    
    //MARK: - Actions
    
    @objc private func closeButtonDidTap() {
        presenter?.handleCloseButton()
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource methods

extension SettingsController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        settings.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settings[section].setting.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = settings[indexPath.section].setting[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SettingTableViewCell.identifier,
            for: indexPath) as? SettingTableViewCell else { return UITableViewCell() }
        cell.configure(with: model, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footer = UIView(frame: CGRect(x: 0,
                                          y: 0,
                                          width: tableView.frame.width,
                                          height: 0))
        
        let label = UILabel(frame: CGRect(x: footer.frame.width * 0.043,
                                          y: footer.frame.height * 0.4,
                                          width: footer.frame.width * 0.9,
                                          height: footer.frame.width * 0.13))
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: view.frame.width * 0.032)
        footer.addSubview(label)
        
        if section == 1 {
            label.text = "До 23:59 можно поменять номер автомобиля и зону, либо продлить парковку"
            footer.backgroundColor = UIColor(rgb: 0x67AD47)
            label.textColor = .white
            return footer
        } else if section == 3 {
            label.text = "Льготные парковочные разрешения и абонементы на парковку"
            footer.backgroundColor = .clear
            label.textColor = .black
            return footer
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 1 || section == 3 {
            return view.frame.width * 0.13
        }
        return view.frame.width * 0.05
    }
}
