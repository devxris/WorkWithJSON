# WorkWithJSON
Work with JSON that model conforms to Decodable protocol  
1. Model conforms to Decodable  
2. Load JSON with URLSession.shared.dataTask { }.resume() call back  
3. Parse JSON with JSONDecoder().decode(Model.self, from: data)  
