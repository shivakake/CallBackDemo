//
//  ViewController.swift
//  CallBackClosures
//
//  Created by Kumaran on 09/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    var listArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func navigatetoNextVC(index: Int?) {
        guard let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "SecondViewController") as? SecondViewController else { return }
        if  listArray.count == 0  {
            controller.data = ""
        } else {
            controller.data = listArray[index ?? 0]
        }
        
        controller.callBack = { [weak self] str in
            self?.listArray.append(str)
            self?.listTableView.reloadData()
        }
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func goToNextButtonTapped(_ sender: UIBarButtonItem) {
        //        guard let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "SecondViewController") as? SecondViewController else { return }
        //        controller.callBack = { [weak self] str in
        //            self?.listArray.append(str)
        //            self?.listTableView.reloadData()
        //        }
        //        navigationController?.pushViewController(controller, animated: true)
        navigatetoNextVC(index: nil)
    }
}

extension ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell else {
            return UITableViewCell()
        }
        cell.callBack = { [weak self] in
            self?.navigatetoNextVC(index: indexPath.row)
        }
        cell.configureCell(listTitle: listArray[indexPath.row])
        return cell
        //        if let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell {
        //            cell.configureCell(listTitle: listArray[indexPath.row])
        //            return cell
        //        }
        //        return UITableViewCell()
        
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        guard let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "SecondViewController") as? SecondViewController else { return }
        //        controller.data = listArray[indexPath.row]
        //        controller.callBack = { [weak self] str in
        //            self?.listArray.append(str)
        //            self?.listTableView.reloadData()
        //        }
        //        navigationController?.pushViewController(controller, animated: true)
    }
}
