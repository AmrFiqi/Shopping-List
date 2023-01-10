//
//  ViewController.swift
//  Shopping List
//
//  Created by Amr El-Fiqi on 09/01/2023.
//

import UIKit

class ViewController: UITableViewController {
    var shoppingList = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Shopping List"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Clear List", style: .plain, target: self, action: #selector(clearList))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        
        return cell
    }
    
    @objc func addItem(){
        let ac = UIAlertController(title: "Add Item", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitItem = UIAlertAction(title: "Add", style: .default){
            [weak self, weak ac] _ in
            guard let answer = ac?.textFields?[0].text else {return}
            self?.submit(answer)
        }
        
        ac.addAction(submitItem)
        present(ac, animated: true)
        
    }
    
    @objc func clearList(){
        shoppingList.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    func submit(_ answer: String){
        shoppingList.insert(answer, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    

}

