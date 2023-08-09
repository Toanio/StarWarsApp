//
//  ResultsTableViewCell.swift
//  StarWarsApp
//
//  Created by c.toan on 08.08.2023.
//

import UIKit
import SnapKit

protocol ResultsTableViewCellDelegate {
    func saveButtonTapped()
}

class ResultsTableViewCell: UITableViewCell {
    static let identifier = "ResultsTableViewCell"
    var delegate: ResultsTableViewCellDelegate?
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.translatesAutoresizingMaskIntoConstraints = true
        return label
    }()
    private var infoOneLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.translatesAutoresizingMaskIntoConstraints = true
        return label
    }()
    private var infoTwoLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.translatesAutoresizingMaskIntoConstraints = true
        return label
    }()
    
    private var saveButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        button.addTarget(nil, action: #selector(saveButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = true
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(saveButton)
        contentView.addSubview(nameLabel)
        contentView.addSubview(infoOneLabel)
        contentView.addSubview(infoTwoLabel)
        
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
        }
        
        infoOneLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(15)
        }

        infoTwoLabel.snp.makeConstraints { make in
            make.top.equalTo(infoOneLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(15)
        }
        
        saveButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().offset(-5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func saveButtonTapped() {
        delegate?.saveButtonTapped()
        
    }
    
    func configure(with people: PeopleResults) {
        self.nameLabel.text = "Имя: \(people.name ?? "Не найдено")"
        self.infoOneLabel.text = "Пол: \(people.gender ?? "Не найдено")"
        self.infoTwoLabel.text = "Колличество звездолетов: \(people.starships?.count ?? 0)"
    }
    
    func configure(with starships: StarshipsResults) {
        self.nameLabel.text = "Название: \(starships.name ?? "Не найдено")"
        self.infoOneLabel.text = "Модель: \(starships.model ?? "Не найдено")"
        self.infoTwoLabel.text = "Производитель: \(starships.manufacturer ?? "")"
    }
    
    func configure(with planet: PlanetResults) {
        self.nameLabel.text = "Название: \(planet.name ?? "Не найдено")"
        self.infoOneLabel.text = "Диаметр: \(planet.diameter ?? "Не найдено" )"
        self.infoTwoLabel.text = "Популяция: \(planet.population ?? "Не найдено")"
    }
}
