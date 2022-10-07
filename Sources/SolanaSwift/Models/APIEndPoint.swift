//
//  APIEndPoint.swift
//  SolanaSwift
//
//  Created by Chung Tran on 26/04/2021.
//

import Foundation

extension SolanaSDK {
    public struct APIEndPoint: Hashable, Codable {
        public init(address: String, network: SolanaSDK.Network, socketUrl: String? = nil, additionalQuery: String? = nil) {
            self.address = address
            self.network = network
            self.socketUrl = socketUrl ?? address.replacingOccurrences(of: "http", with: "ws")
            self.additionalQuery = additionalQuery
        }
        
        public let address: String
        public var network: Network
        public var socketUrl: String
        public let additionalQuery: String?
        
        public static var defaultEndpoints: [Self] {
            var endpoints: [Self] = [
//                .init(address: "https://solana-api.projectserum.com", network: .mainnetBeta),
                .init(address: "https://solana-mainnet.g.alchemy.com/v2/kHjqxy68NcFsGU5YlWB4nTKAk-P8gOAS", network: .mainnetBeta)
//                .init(address: "https://datahub-proxy.p2p.org", network: .mainnetBeta),
//                .init(address: "https://api.devnet.solana.com", network: .devnet),
//                .init(address: "https://api.testnet.solana.com", network: .testnet)
            ]
//            #if DEBUG
            endpoints.append(.init(address: "https://api.testnet.solana.com", network: .testnet))
            endpoints.append(.init(address: "https://api.devnet.solana.com", network: .devnet))
//            #endif
            
            return endpoints
        }
        
        public func getURL() -> String {
            var url = self.address
            if let query = additionalQuery {
                url += "/" + query
            }
            return url
        }
    }
}
