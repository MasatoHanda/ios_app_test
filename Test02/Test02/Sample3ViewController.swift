//
//  Sample3ViewController.swift
//  Test02
//
//  Created by bss_mobile_dev on 2020/02/10.
//  Copyright © 2020 bss_mobile_dev. All rights reserved.
//

import UIKit

class Sample3ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    private lazy var sample3Child1ViewController: Sample3Child1ViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(identifier: "Sample3Child1ViewController") as! Sample3Child1ViewController
        add(asChildViewController: viewController)
        return viewController
    }()
    
    private lazy var sample3Child2ViewController: Sample3Child2ViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(identifier: "Sample3Child2ViewController") as! Sample3Child2ViewController
        add(asChildViewController: viewController)
        return viewController
    }()
    
    private lazy var sample3Child3ViewController: Sample3Child3ViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(identifier: "Sample3Child3ViewController") as! Sample3Child3ViewController
        add(asChildViewController: viewController)
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

        // Do any additional setup after loading the view.
    }

    
    private func updateView(){
        switch(segmentedControl.selectedSegmentIndex){
        case 0:
            remove(asChildViewController: sample3Child2ViewController)
            remove(asChildViewController: sample3Child3ViewController)
            add(asChildViewController: sample3Child1ViewController)
            break
        case 1:
            remove(asChildViewController: sample3Child1ViewController)
            remove(asChildViewController: sample3Child3ViewController)
            add(asChildViewController: sample3Child2ViewController)
            break
        case 2:
            remove(asChildViewController: sample3Child1ViewController)
            remove(asChildViewController: sample3Child2ViewController)
            add(asChildViewController: sample3Child3ViewController)
            break
        default:
            break
        }
    }
    
    @IBAction func tapSegmentedControl(_ sender: UISegmentedControl) {
        updateView()
    }
    
    private func setupView(){
        updateView()
    }
    
    private func add(asChildViewController viewController: UIViewController){
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)  //追加が終わったことを通知
    }
    
    private func remove(asChildViewController viewController: UIViewController){
        viewController.willMove(toParent: nil)  //これから取り除くことを通知
        viewController.view.removeFromSuperview()   //viewを取り除く
        viewController.removeFromParent()   //親子関係を取り除く
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
