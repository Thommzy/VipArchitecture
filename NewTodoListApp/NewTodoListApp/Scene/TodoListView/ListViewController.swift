//
//  ViewController.swift
//  NewTodoListApp
//
//  Created by Tim on 17/10/2020.
//

import UIKit

class ListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var todoColllectionView: UICollectionView?
    var cellWidth : Int?
    let todoLabel : UILabel = {
        let label = UILabel()
        label.text = ListViewConstants.labelText
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        labelConstraint()
        loadCollectionView()
        navigationBarStyle()
    }
    
    func labelConstraint() {
        todoLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(todoLabel)
        todoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        todoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        todoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        todoLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        todoLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
    }
    
    func loadCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 3, bottom: 0, right: 2)
        let screenSize = UIScreen.main.bounds.width
        let leftRightAndCenter = 85
        cellWidth = (Int(screenSize) - leftRightAndCenter) / 2
        layout.itemSize = CGSize(width: cellWidth ?? 0, height: 100)
        todoColllectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        todoColllectionView?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(todoColllectionView ?? UICollectionView())
        todoColllectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: ListViewConstants.CollectionViewCellId)
        todoColllectionView?.backgroundColor = UIColor.white
        todoColllectionView?.dataSource = self
        todoColllectionView?.delegate = self
        todoColllectionView?.topAnchor.constraint(equalTo: todoLabel.bottomAnchor, constant: 0).isActive = true
        todoColllectionView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        todoColllectionView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        todoColllectionView?.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        todoColllectionView?.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        todoColllectionView?.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    }
    
    func navigationBarStyle() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User Tapped on item \(indexPath.row)")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let todoCell = collectionView.dequeueReusableCell(withReuseIdentifier: ListViewConstants.CollectionViewCellId, for: indexPath)
        if indexPath.row == 1 {
            let imageview: UIImageView = UIImageView(frame: CGRect(x: cellWidth! - 30, y: 10, width: 20, height: 20));
            let image = UIImage(systemName: ListViewConstants.addIcon, withConfiguration: UIImage.SymbolConfiguration(weight: .semibold))?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
            imageview.image = image
            todoCell.contentView.addSubview(imageview)
            let title = UILabel(frame: CGRect(x: 10, y: 55, width: todoCell.bounds.size.width, height: 40))
            title.text = ListViewConstants.createText
            title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            todoCell.contentView.addSubview(title)
        }
        todoCell.backgroundColor = .white
        todoCell.layer.cornerRadius = 10
        todoCell.layer.borderColor = UIColor.clear.cgColor
        todoCell.layer.shadowColor = UIColor.gray.cgColor
        todoCell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        todoCell.layer.shadowRadius = 2.0
        todoCell.layer.shadowOpacity = 0.5
        todoCell.layer.masksToBounds = false
        return todoCell
    }
}

