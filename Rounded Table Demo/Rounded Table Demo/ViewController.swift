import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    var data = ["One", "Two", "Three"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let containerView:UIView = UIView(frame: tableView.frame)
        containerView.backgroundColor = UIColor.clear
        containerView.layer.shadowColor = UIColor.darkGray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        containerView.layer.shadowOpacity = 1.0
        containerView.layer.shadowRadius = 2
        
        tableView.layer.cornerRadius = 10
        tableView.layer.masksToBounds = true
        
        self.view.addSubview(containerView)
        containerView.addSubview(tableView)
//        self.view.addSubview(tableView)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = data[indexPath.row]
        if let cell = cell {
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            data.remove(at: indexPath.row)
        }
        tableView.reloadData()
    }
}

