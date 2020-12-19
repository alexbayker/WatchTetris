import Foundation

public class Record : Identifiable
{
    public static var records = getRecordsList()
    
    public static let dateformatinbackup: DateFormatter = {
        let dateformat = DateFormatter()
            dateformat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        return dateformat
    }()
    
    public static let dateformatforuser: DateFormatter = {
        let dateformat = DateFormatter()
        dateformat.dateFormat = "HH:mm:ss dd.MM.yyyy"
        return dateformat
    }()
    
    public static let recordsrecourcename = "records"
    public static let mynamerecourcename = "myname"
    
    private var name: String
    public var score: Int
    private var date: String
    private var isnow = false
    
    init(name: String, score: Int, date: String)
    {
        self.name = name
        self.score = score
        self.date = date
    }
    
    init(name: String, score: Int, date: String, now: Bool)
    {
        self.name = name
        self.score = score
        self.date = date
        self.isnow = now
    }
    
    public func getName() -> String
    {
        return self.name
    }
    
    public func getScore() -> Int
    {
        return self.score
    }
    
    public func getDate() -> Date
    {
        guard let date = Record.dateformatinbackup.date(from: self.date)
        else
        {
            fatalError("Date parse error \(self.date)")
        }
        return date;
    }
    
    public func getDateString() -> String
    {
        return self.date;
    }
    
    public func getStringForUI() -> String
    {
        return Record.dateformatforuser.string(from: self.getDate())
    }
    
    public func getIsNow() -> Bool
    {
        return self.isnow
    }
    
    public func compareTo(_ two: Record) -> Bool
    {
        if self.score != two.score
        {
            return self.score > two.score
        }
        else if self.getDate().distance(to: two.getDate()) != 0
        {
            return self.getDate().distance(to: two.getDate()) > 0
        }
        return self.getName() > two.getName()
    }
    
    public static func addRecord(_ record: Record)
    {
        if let index = records.firstIndex(where: { $0.score < record.score}) {
            records.insert(record, at: index)
        }
        else
        {
            records.append(record)
        }
        var string = "["
        for i in 0 ..< records.count
        {
            if i > 0
            {
                string += ", "
            }
            string += "{\"name\": \"\(records[i].getName())\", \"score\": \(records[i].getScore()), \"date\": \"\(records[i].getDateString())\"}"
        }
        string += "]"
        UserDefaults.standard.set(string, forKey: recordsrecourcename)
        UserDefaults.standard.set(record.name, forKey: mynamerecourcename)
    }
    
    public static func getRecordsList() -> [Record]
    {
        var answer = [Record]()
        do
        {
            if let stringjson = UserDefaults.standard.string(forKey: recordsrecourcename),
               let recordsjson = try JSONSerialization.jsonObject(with: stringjson.data(using: .utf8)!, options: []) as? [[String: Any]]
            {
                for record in recordsjson
                {
                    if  let name = record["name"] as? String,
                        let score = record["score"] as? Int,
                        let date = record["date"] as? String {
                            answer.append(Record(name: name, score: score, date: date))
                    }
                }
            }
        }
        catch {
            print("Reading records error! \(error)")
        }
        
        return answer.sorted(by: {$0.compareTo($1)});
    }
}
