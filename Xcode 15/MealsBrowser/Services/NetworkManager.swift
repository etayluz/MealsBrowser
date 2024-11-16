import Foundation

//enum NetworkError: Error {
//    case invalidURL
//    case requestFailed
//    case decodingFailed
//}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}

    func get<T: Decodable>(urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
//            throw NetworkError.invalidURL
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)

        // Check for valid response
//        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
//            throw NetworkError.requestFailed
//        }  
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            print(decodedData)
            return decodedData
        } catch (let error) {
//            throw NetworkError.decodingFailed
            print(error)
            throw URLError(.cannotDecodeRawData)
        }
    }

    func post<T: Encodable, U: Decodable>(urlString: String, body: T) async throws -> U {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONEncoder().encode(body)
        } catch {
            throw URLError(.cannotDecodeRawData)
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)

        // Check for valid response
//        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
//            throw NetworkError.requestFailed
//        }
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        do {
            let decodedData = try JSONDecoder().decode(U.self, from: data)
            return decodedData
        } catch {
//            throw NetworkError.decodingFailed
            throw URLError(.cannotDecodeRawData)
        }
    }
}
