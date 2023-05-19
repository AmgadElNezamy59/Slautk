import UIKit

class ViewController: UIViewController  {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var fajrTime: UILabel!
    @IBOutlet weak var sunriseTime: UILabel!
    @IBOutlet weak var dhuhrTime: UILabel!
    @IBOutlet weak var asrTime: UILabel!
    @IBOutlet weak var maghribTime: UILabel!
    @IBOutlet weak var ishaTime: UILabel!
    var prayManager = PrayManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        prayManager.delegate = self
    }

    @IBAction func SearchButton(_ sender: UIButton) {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        


        
    }
}

extension ViewController: UITextFieldDelegate{
    // IBACtion for Return Key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    // Use for Validate befor end editing
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextField.text != ""{
            return true
        }else{
            searchTextField.placeholder = "Write Somthing"
            return false
        }
    }
    
    // when the editing end it work
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text{
            prayManager.fetchPrayTime(cityName: city)

        }
        searchTextField.text = ""
        
    }
}
    
//
//        fajrTime.text = praytime.Fajr
//        sunriseTime.text = praytime.Sunrise
//        dhuhrTime.text = praytime.Dhuhr
//        asrTime.text = praytime.Asr
//        maghribTime.text = praytime.Maghrib
//        ishaTime.text = praytime.Isha
//
//
extension ViewController : prayManagerDelegate {
    func didUpdatePrayTime(praytime: PrayModel) {
        DispatchQueue.main.sync {
            fajrTime.text = praytime.Fajr
            sunriseTime.text = praytime.Sunrise
            dhuhrTime.text = praytime.Dhuhr
            asrTime.text = praytime.Asr
            maghribTime.text = praytime.Maghrib
            ishaTime.text = praytime.Isha   
        }
       
    }
    
    
}



