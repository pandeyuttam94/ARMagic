//
//  GameViewController.swift
//  ARMagic
//
//  Created by Uttam Pandey on 21/11/18.
//  Copyright © 2018 Uttam Pandey. All rights reserved.
//

import ARKit
import LBTAComponents

class GameViewController: UIViewController {
    
    let arView : ARSCNView = {
        let view = ARSCNView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let plusButtonWidth = ScreenSize.width * 0.1
    
    lazy var plusButton: UIButton = {
        var button = UIButton(type: .system)
        button.setImage(UIImage(named: "plusButton")?.withRenderingMode(.alwaysTemplate), for: .normal)
        //button.tintColor = UIColor(red: 230, green: 145, blue: 31)
        button.tintColor = UIColor(white: 1.0, alpha: 0.7)
        button.layer.cornerRadius = plusButtonWidth / 2
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handlePlusButtonTapped), for: .touchUpInside)
        button.layer.zPosition = 1
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    @objc func handlePlusButtonTapped() {
        
    }
    
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        arView.session.run(configuration, options: [])
        arView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, .showFeaturePoints]
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func setupViews() {
//        arView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        arView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        arView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        arView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        view.addSubview(arView)
//        arView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        arView.fillSuperview()
        
        view.addSubview(plusButton)
        plusButton.anchor(nil, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: nil, topConstant: 0, leftConstant: 24, bottomConstant: 12, rightConstant: 0, widthConstant: plusButtonWidth, heightConstant: plusButtonWidth)
    }
}
