//
//  ViewController.swift
//  TableViewCustomHeader
//
//  Created by praveen on 10/11/18.
//  Copyright © 2018 DemoApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var segmentIndex = 0
    let array1 = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25"]
    let array2 = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]
    
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        // Set a header for the table view
        let header = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.height/4))
        header.backgroundColor = UIColor (red: 20/255, green: 175/255, blue: 120/255, alpha: 1.0)
        
        let profileImage = UIImageView()
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.layer.cornerRadius = 50
        header.addSubview(profileImage)
        profileImage.backgroundColor = .white
        profileImage.centerXAnchor.constraint(equalTo: header.centerXAnchor).isActive = true
        profileImage.centerYAnchor.constraint(equalTo: header.centerYAnchor).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let profileName = UILabel()
        profileName.translatesAutoresizingMaskIntoConstraints = false
        profileName.textAlignment = .center
        header.addSubview(profileName)
        profileName.text = "Title"
        profileName.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10).isActive = true
        profileName.centerXAnchor.constraint(equalTo: profileImage.centerXAnchor).isActive = true
        profileName.widthAnchor.constraint(equalTo: header.widthAnchor, multiplier: 0.5).isActive = true
        profileName.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        tableView.tableHeaderView = header // assign
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView()
        v.backgroundColor = .white
        let segmentedControl = UISegmentedControl()
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.insertSegment(withTitle: "Tab 1", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Tab 2", at: 1, animated: false)
        v.addSubview(segmentedControl)
        segmentedControl.selectedSegmentIndex = segmentIndex
        segmentedControl.addTarget(self, action: #selector(selectedSegmentedControlIndex(_:)), for: UIControlEvents.valueChanged)
        
        segmentedControl.topAnchor.constraint(equalTo: v.topAnchor).isActive = true
        segmentedControl.centerXAnchor.constraint(equalTo: v.centerXAnchor).isActive = true
        segmentedControl.widthAnchor.constraint(equalToConstant: 200).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return v
    }
    
    //MARK:- UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentIndex == 0 {
            return array1.count
        } else {
            return array2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        if segmentIndex == 0 {
            cell.textLabel?.text = array1[indexPath.row]
        } else {
            cell.textLabel?.text = array2[indexPath.row]
        }
        return cell
    }
    
    @objc func selectedSegmentedControlIndex(_ segmentedControl: UISegmentedControl) {
        self.segmentIndex = segmentedControl.selectedSegmentIndex
        tableView.reloadData()
    }
    
}


