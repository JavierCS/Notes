import UIKit

struct UnsplashPhoto: Codable {
    let id: String?
    let slug: String?
    let alternative_slugs: UnsplashSlugs?
    let created_at: Date?
    let updated_at: Date?
    let promoted_at: Date?
    let width: Int?
    let height: Int?
    let blur_hash: String?
    let description: String?
    let alt_description: String?
//    let breadcrumbs: []
    let urls: UnsplashUrls?
    let links: UnsplashLinks?
    let likes: Int?
    let liked_by_user: Bool
//    let current_user_collections: []
    let sponsorship: UnsplashSponsorship?
//    let topic_submissions
    let asset_type: String?
    let user: UnsplashUser?
}

struct UnsplashSlugs: Codable {
    let en: String?
    let es: String?
    let ja: String?
    let fr: String?
    let it: String?
    let ko: String?
    let de: String?
    let pt: String?
    let id: String?
}

struct UnsplashUrls: Codable {
    let raw: URL?
    let full: URL?
    let regular: URL?
    let small: URL?
    let medium: URL?
    let large: URL?
    let thumb: URL?
    let small_s3: URL?
}

struct UnsplashLinks: Codable {
    let my: URL?
    let html: URL?
    let download: URL?
    let download_location: URL?
    let photos: URL?
    let likes: URL?
    let portfolio: URL?
    
    enum CodingKeys: String, CodingKey {
        case my = "self"
        case html
        case download
        case download_location
        case photos
        case likes
        case portfolio
    }
}

struct UnsplashSponsorship: Codable {
//    let impression_urls: []
    let tagline: String?
    let tagline_url: URL?
    let sponsor: UnsplashSponsor?
}

struct UnsplashSponsor: Codable {
    let id: String?
    let updated_at: Date?
    let username: String?
    let name: String?
    let first_name: String?
    let last_name: String?
    let twitter_username: String?
    let portfolio_url: URL?
    let bio: String?
    let location: String?
    let links: UnsplashLinks?
    let profile_image: UnsplashUrls?
    let instagram_username: String?
    let total_collections: Int?
    let total_likes: Int?
    let total_photos: Int?
    let total_promoted_photos: Int?
    let total_illustrations: Int?
    let total_promoted_illustrations: Int?
    let accepted_tos: Bool
    let for_hire: Bool
    let social: UnsplashSocial?
}

struct UnsplashSocial: Codable {
    let instagram_username: String?
    let portfolio_url: URL?
    let twitter_username: String?
    let paypal_email: String?
}

struct UnsplashUser: Codable {
    let id: String?
    let updated_at: Date?
    let username: String?
    let name: String?
    let first_name: String?
    let last_name: String?
    let twitter_username: String?
    let portfolio_url: URL?
    let bio: String?
    let location: String?
    let links: UnsplashLinks?
    let profile_image: UnsplashUrls?
    let instagram_username: String?
    let total_collections: Int?
    let total_likes: Int?
    let total_photos: Int?
    let total_promoted_photos: Int?
    let total_illustrations: Int?
    let total_promoted_illustrations: Int?
    let accepted_tos: Bool
    let for_hire: Bool
    let social: UnsplashSocial?
}

func loadObjects() async throws -> [UnsplashPhoto] {
    guard let url = URL(string: "https://api.unsplash.com/photos/?client_id=hQ0dBuSG4FYmilL4coWlIqvS_Si4MEt2oSRzKa05VbY") else {
        throw URLError(.badURL)
    }
    let (data, response) = try await URLSession.shared.data(from: url)
    guard let httpReponse = response as? HTTPURLResponse,
          (200..<300).contains(httpReponse.statusCode) else {
        throw URLError(.badServerResponse)
    }
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    let photos = try decoder.decode([UnsplashPhoto].self, from: data)
    return photos
}

Task {
    do {
        let photos = try await loadObjects()
        photos.forEach { photo in
            print("id: \(photo.id ?? "nil")")
            print("slug: \(photo.slug ?? "nil")\n")
        }
    } catch {
        print(error)
    }
}
