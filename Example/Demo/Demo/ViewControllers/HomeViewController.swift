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
    var cubeContainViewController : CTLCubeContainerViewController!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView(){
        let listVCName = ["FirstViewController","SecondViewController","ThirdViewController","ForthViewController","FithViewController","SixthViewController"]
        var listVC = [UIViewController]()
        for idVCName in listVCName{
            let vc = self.storyboard!.instantiateViewController(withIdentifier: idVCName)
            listVC.append(vc)
        }
        cubeContainViewController = CTLCubeContainerViewController(viewControllers: listVC)
        
        cubeContainViewController.dataSource = self
        
//        cubeContainViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .rewind, target: cubeContainViewController, action: #selector(CTLCubeContainerViewController.navigateToPreviousViewController))
//        cubeContainViewController.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fastForward, target: cubeContainViewController, action: #selector(CTLCubeContainerViewController.navigateToNextViewController))
        
    }
    
    @IBAction func btnPushPress(_ sender: Any) {
        self.navigationController?.pushViewController(cubeContainViewController, animated: true)
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

