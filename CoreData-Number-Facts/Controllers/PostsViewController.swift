//
//  ViewController.swift
//  CoreData-Number-Facts
//
//  Created by Alex Paul on 4/8/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  private var posts = [Post]() {
    didSet {
      tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    fetchPosts()
  }
  
  private func fetchPosts() {
    posts = CoreDataManager.shared.fetchPosts()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let createPostVC = segue.destination as? CreatePostViewController else {
      fatalError("could not segue to CreatePostView Controller")
    }
    // since we have the instance to the CreatePostViewController we are now able to set the delegate
    createPostVC.delegate = self
  }
}

extension PostsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
    let post = posts[indexPath.row]
    cell.textLabel?.text = "\(post.title ?? "") \(post.number)"
    cell.detailTextLabel?.text = "Posted by: \(post.user?.name ?? "")"
    return cell
  }

}

extension PostsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 44
    
  }
}

extension PostsViewController: CreatePostDelegate {
  func didCreatePost(_ createPostViewController: CreatePostViewController, post: Post) {
    posts.append(post)
  }
}

