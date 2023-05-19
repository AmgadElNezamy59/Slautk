import Foundation
protocol prayManagerDelegate{
    func didUpdatePrayTime(praytime :PrayModel)
}

struct PrayManager{
    let prayTimeURL = "https://api.aladhan.com/v1/calendarByCity?country=egypt&city="
    var delegate : prayManagerDelegate?
    func fetchPrayTime(cityName: String){
        let urlString = "\(prayTimeURL)\(cityName)"
        performRequest(urlString)
    }
    
    func performRequest(_ urlString : String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safedata = data{
                    //print(safedata)
                    if let pray = self.parseJSON(prayData: safedata){
                        self.delegate?.didUpdatePrayTime(praytime: pray)
                    }
                    }
                   
            }
            task.resume()
        }
    }
    
    func parseJSON(prayData: Data) -> PrayModel? {
        let decoder = JSONDecoder()
        do{
           let decodedData =  try decoder.decode(PrayData.self, from: prayData)
            let Fajr = decodedData.data[0].timings.Fajr
            let Sunrise = decodedData.data[0].timings.Sunrise
            let Dhuhr = decodedData.data[0].timings.Dhuhr
            let Asr = decodedData.data[0].timings.Asr
            let Maghrib = decodedData.data[0].timings.Maghrib
            let Isha = decodedData.data[0].timings.Isha
            let pray = PrayModel(Fajr: Fajr, Sunrise: Sunrise, Dhuhr: Dhuhr, Asr: Asr, Maghrib: Maghrib, Isha: Isha)
            print(pray)
            return pray
        }catch{
            print(error)
            return nil

        }
    }
}
