//
//  TaskListViewController.swift
//  GoodList
//
//  Created by Bibi on 2022/12/19.
//

import Foundation
import UIKit
import RxSwift

class TaskListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    private var tasks = Variable<[Task]>([])
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 테이블뷰 셀을 만드는 메서드
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navC = segue.destination as? UINavigationController,
              let addTaskVC = navC.viewControllers.first as? AddTaskViewController else {
            fatalError("Controller not found")
        }
        
        addTaskVC.taskSubjectObservable
            .subscribe(onNext: { task in
                self.tasks.value.append(task)
            }).disposed(by: disposeBag)
    }
}
