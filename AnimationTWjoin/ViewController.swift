//
//  ViewController.swift
//  AnimationTWjoin
//
//  Created by Andre on 2023/6/2.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var animationTableView: UITableView! {
        didSet {
            animationTableView.delegate = self
            animationTableView.dataSource = self
        }
    }
    
    let animations = AnimationType.allValues
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animationTableView.reloadData()
    }
}

// MARK: - TableView Delegate & Data Source
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AnimationType.allValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = animations[indexPath.row].rawValue
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let animationViewController = AnimationViewController(type: animations[indexPath.row])
        self.present(animationViewController, animated: true)
    }
}
