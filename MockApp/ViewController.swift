//
//  ViewController.swift
//  MockApp
//
//  Created by Harold Villacob on 29/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel = WeatherViewModel()
    
    let regionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let localTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let conditionTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(regionLabel)
        view.addSubview(localTimeLabel)
        view.addSubview(conditionTextLabel)
        
        NSLayoutConstraint.activate([
            regionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            regionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            localTimeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            localTimeLabel.topAnchor.constraint(equalTo: regionLabel.bottomAnchor, constant: 20),
            
            conditionTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            conditionTextLabel.topAnchor.constraint(equalTo: localTimeLabel.bottomAnchor, constant: 20)
        ])
        
        self.viewModel.fetchWeatherData()
        
        self.viewModel.successCallback = { [weak self] in
            DispatchQueue.main.async {
                self?.regionLabel.text = self?.viewModel.region
                self?.localTimeLabel.text = self?.viewModel.localTime
                self?.conditionTextLabel.text = self?.viewModel.conditionText
            }
        }
    }


}

