
import UIKit

class Expense{
    var title: String
    var amount: Double
    var date: Date
    
    init?(title:String, amount:Double, date:String){
        
        guard !title.isEmpty else{
            return nil
        }
        
        self.title = title
        self.amount = amount
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy HH:mm"
        self.date = dateFormatter.date(from: date)!
    }
}

class ExpenseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

class ExpenseTableViewController: UITableViewController {

    
    var a = [Expense]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let expense1 = Expense.init(title:"Dinner", amount:32.50, date:"June 1, 2018 18:30") else{
            fatalError("Unable to instantiate expense1")
        }
        guard let expense2 = Expense.init(title:"Office Supplies", amount:59.34, date:"May 30, 2018 12:17")else{
            fatalError("Unable to instantiate expense2")
        }
        guard let expense3 = Expense.init(title:"Uber", amount:16.23, date: "May 30, 2018 11:43")else{
            fatalError("Unable to instantiate expense3")
        }
        guard let expense4 = Expense.init(title:"Coffee", amount:3.95, date:"May 29, 2018 8:45")else{
            fatalError("Unable to instantiate expense4")
        }
        a += [expense1, expense2, expense3, expense4]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return a.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ExpenseTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ExpenseTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        // Configure the cell...
        let expense = a[indexPath.row]
        
        cell.titleLabel.text = expense.title
        cell.amountLabel.text = "$"+String(expense.amount)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy HH:mm"
        cell.dateLabel.text = dateFormatter.string(from: expense.date)
        

        return cell
    }

}
