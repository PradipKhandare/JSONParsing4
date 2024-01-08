//
//  ViewController.swift
//  JSONParsing4
//
//  Created by NTS on 08/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var jsonData = [JsonDataModel]()
    //URL :- https://restcountries.com/v2/all
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        getData()
    }

    func getData(){
        guard let url = URL(string: "https://restcountries.com/v2/all") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!)
                return
            }
            if let safeData = data {
                do{
                    let json = try JSONDecoder().decode([JsonDataModel].self, from: safeData)
                    self.jsonData = json
                    for _ in self.jsonData{
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                    }
                }catch {
                    print(error)
                }
            }
        }.resume()
       
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyTableViewCell
        cell?.nameLabel.text = jsonData[indexPath.row].name
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondVc = (self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController)!
        
        
        secondVc.strAlpha3 = jsonData[indexPath.row].alpha3Code
        secondVc.strAlpha2 = jsonData[indexPath.row].alpha2Code
        secondVc.strRegion = jsonData[indexPath.row].region
        secondVc.strSubregion = jsonData[indexPath.row].subregion
        self.navigationController?.pushViewController(secondVc, animated: true)
    }
    
}



