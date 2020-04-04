//
//  HomeViewController.swift
//  CubeAnimation
//
//  Created by Linh on 4/3/20.
//  Copyright © 2020 Can Thai Linh. All rights reserved.
//

import UIKit
import CTLCubeContainerViewController
class HomeViewController: UIViewController {
    var cubeCtrl : CTLCubeContainerViewController!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView(){
        let listVCName = ["FirstViewController","SecondViewController","ThirdViewController","ForthViewController"]
        var listVC = [UIViewController]()
        for idVCName in listVCName{
            let vc = self.storyboard!.instantiateViewController(withIdentifier: idVCName)
            listVC.append(vc)
        }
        cubeCtrl = CTLCubeContainerViewController(viewControllers: listVC)
        
        cubeCtrl.dataSource = self
        
//        cubeCtrl.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .rewind, target: cubeCtrl, action: #selector(CubeContainerViewController.navigateToPreviousViewController))
//        cubeCtrl.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fastForward, target: cubeCtrl, action: #selector(CubeContainerViewController.navigateToNextViewController))
        
    }
    
    @IBAction func btnPushPress(_ sender: Any) {
        self.navigationController?.pushViewController(cubeCtrl, animated: true)
//        cubeCtrl.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension HomeViewController: CTLCubeContainerDataSource {
    func cubeContainerViewController(_ cubeContainerViewController: CTLCubeContainerViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return  nil
    }
}

extension UIView {
    
    fileprivate func centerSubview(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        view.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        view.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
}
