//
//  TableViewController.swift
//  SlapChat
//
//  Created by Ian Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit


class TableViewController: UITableViewController {

  let store = DataStore.sharedInstance


    override func viewDidLoad() {
        super.viewDidLoad()

    }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    store.fetchData()

    if store.messages.isEmpty {
      generateTestData()
    }
    tableView.reloadData()
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return store.messages.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath)
    cell.textLabel?.text = store.messages[indexPath.row].content

    return cell
  }

  func generateTestData() {

    let date = NSDate()

    store.storeMessage(content: "test", date: date)
    store.saveContext()
    store.fetchData()
    tableView.reloadData()
  }
  @IBAction func onAdd(_ sender: UIBarButtonItem) {
  }


}
