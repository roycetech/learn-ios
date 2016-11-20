import UIKit

//import PlaygroundSupport

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    let tableView = UITableView(frame: CGRect.zero, style: .plain)
    let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    
    var text = ["dog 🐶", "cat 🐱", "mouse 🐭", "bird 🐦", "rat 🐀", "chicken 🐔"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.frame = self.containerView.bounds
        self.tableView.delegate = self
        self.tableView.dataSource = self
        containerView.backgroundColor = UIColor.clear
        containerView.layer.shadowColor = UIColor.darkGray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        containerView.layer.shadowOpacity = 1.0
        containerView.layer.shadowRadius = 2
        
        tableView.layer.cornerRadius = 10
        tableView.layer.masksToBounds = true
        self.view.addSubview(containerView)
        containerView.addSubview(tableView)
        
    }
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        self.containerView.center = self.view.center
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.text.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.text[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        guard editingStyle == .delete else { return }
        self.text.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}

//PlaygroundPage.current.liveView = ViewController()
