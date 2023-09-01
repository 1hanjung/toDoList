import UIKit

class IncompleteTasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tasks: [String] = []  // 할일 데이터를 저장할 배열
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        // 테이블 뷰 생성 및 설정
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)

        // 오토레이아웃 설정
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // 오른쪽 상단에 "추가" 버튼 추가
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddTaskAlert))
    }

    @objc func showAddTaskAlert() {
        let alertController = UIAlertController(title: "할일 추가", message: "새로운 할일을 입력하세요.", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "할일 내용"
        }

        let addAction = UIAlertAction(title: "추가", style: .default) { [weak self, weak alertController] _ in
            guard let textField = alertController?.textFields?.first, let taskText = textField.text, !taskText.isEmpty else {
                return
            }

            self?.tasks.append(taskText)
            self?.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)

        alertController.addAction(addAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }

    // UITableViewDataSource 메서드 구현
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "TaskCell")
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }

}
