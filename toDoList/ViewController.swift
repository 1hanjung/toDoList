

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let incompleteTasksButton = UIButton(type: .system)
        incompleteTasksButton.setTitle("할일 확인하기", for: .normal)
        incompleteTasksButton.addTarget(self, action: #selector(showIncompleteTasks), for: .touchUpInside)
        
        let completedTasksButton = UIButton(type: .system)
        completedTasksButton.setTitle("완료한일 보기", for: .normal)
        completedTasksButton.addTarget(self, action: #selector(showCompletedTasks), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [incompleteTasksButton, completedTasksButton])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func showIncompleteTasks() {
        let incompleteTasksVC = IncompleteTasksViewController()
        navigationController?.pushViewController(incompleteTasksVC, animated: true)
    }
    
    @objc func showCompletedTasks() {
        let completedTasksVC = CompletedTasksViewController()
        navigationController?.pushViewController(completedTasksVC, animated: true)
    }
}




