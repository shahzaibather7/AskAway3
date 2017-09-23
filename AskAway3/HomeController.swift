//
//  ViewController.swift
//  AskAway3
//
//  Created by Mohammad Shahzaib Ather on 2017-09-01.
//  Copyright © 2017 Mohammad Shahzaib Ather. All rights reserved.
//

import UIKit
import Firebase



class HomeController: UICollectionViewController , UICollectionViewDelegateFlowLayout {

 
    private let cellid = "cellid"
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(JobDetailsCell.self, forCellWithReuseIdentifier: cellid)
        collectionView?.alwaysBounceVertical = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //call the view controller for the detailed items 
    
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
}

class JobDetailsCell: BaseCell {
    
    let profileImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
       
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 34
        return imageView
    }()
    
    let dividerLineView : UIView = {
        let dividerlineView = UIView()
        dividerlineView.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return dividerlineView
    }()
    
    override func setupViews() {
        backgroundColor = UIColor.white
        addSubview(profileImageView)
        addSubview(dividerLineView)
        
        
        
        setupContainerView()
        
        profileImageView.image = UIImage(named: "monet")
        addConstraintsWithFormat(format: "H:|-12-[v0(68)]|", views: profileImageView)
        addConstraintsWithFormat(format:"V:[v0(68)]" , views: profileImageView)
        addConstraint(NSLayoutConstraint(item: profileImageView, attribute: NSLayoutAttribute.centerY , relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0))
        
        addConstraintsWithFormat(format:"H:|-82-[v0]|" , views: dividerLineView)
        addConstraintsWithFormat(format:"V:[v0(1)]|" , views: dividerLineView)
       
       
    }
    
    private func setupContainerView(){
        let containerView = UIView()
        containerView.backgroundColor = UIColor.red
        addSubview(containerView)
        
        addConstraintsWithFormat(format: "H:|-90-[v0]|", views: containerView)
        addConstraintsWithFormat(format: "V:[v0(60)]", views: containerView)
    }
    
}


// Extension for UIView Constraints so less code is being used


extension UIView {
    
   
    
    func addConstraintsWithFormat(format: String, views: UIView...){
        
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
            
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format , options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary ))
    }
}

class BaseCell : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        backgroundColor = UIColor.blue
    }
}

