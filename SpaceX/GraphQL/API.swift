// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class HomeInfoQueryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query HomeInfoQuery {
      company {
        __typename
        summary
        founder
        founded
        valuation
        links {
          __typename
          twitter
        }
      }
      histories {
        __typename
        title
        details
        links {
          __typename
          article
        }
      }
    }
    """

  public let operationName: String = "HomeInfoQuery"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("company", type: .object(Company.selections)),
        GraphQLField("histories", type: .list(.object(History.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(company: Company? = nil, histories: [History?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "company": company.flatMap { (value: Company) -> ResultMap in value.resultMap }, "histories": histories.flatMap { (value: [History?]) -> [ResultMap?] in value.map { (value: History?) -> ResultMap? in value.flatMap { (value: History) -> ResultMap in value.resultMap } } }])
    }

    public var company: Company? {
      get {
        return (resultMap["company"] as? ResultMap).flatMap { Company(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "company")
      }
    }

    public var histories: [History?]? {
      get {
        return (resultMap["histories"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [History?] in value.map { (value: ResultMap?) -> History? in value.flatMap { (value: ResultMap) -> History in History(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [History?]) -> [ResultMap?] in value.map { (value: History?) -> ResultMap? in value.flatMap { (value: History) -> ResultMap in value.resultMap } } }, forKey: "histories")
      }
    }

    public struct Company: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Info"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("summary", type: .scalar(String.self)),
          GraphQLField("founder", type: .scalar(String.self)),
          GraphQLField("founded", type: .scalar(Int.self)),
          GraphQLField("valuation", type: .scalar(Double.self)),
          GraphQLField("links", type: .object(Link.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(summary: String? = nil, founder: String? = nil, founded: Int? = nil, valuation: Double? = nil, links: Link? = nil) {
        self.init(unsafeResultMap: ["__typename": "Info", "summary": summary, "founder": founder, "founded": founded, "valuation": valuation, "links": links.flatMap { (value: Link) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var summary: String? {
        get {
          return resultMap["summary"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "summary")
        }
      }

      public var founder: String? {
        get {
          return resultMap["founder"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "founder")
        }
      }

      public var founded: Int? {
        get {
          return resultMap["founded"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "founded")
        }
      }

      public var valuation: Double? {
        get {
          return resultMap["valuation"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "valuation")
        }
      }

      public var links: Link? {
        get {
          return (resultMap["links"] as? ResultMap).flatMap { Link(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "links")
        }
      }

      public struct Link: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["InfoLinks"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("twitter", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(twitter: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "InfoLinks", "twitter": twitter])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var twitter: String? {
          get {
            return resultMap["twitter"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "twitter")
          }
        }
      }
    }

    public struct History: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["History"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("details", type: .scalar(String.self)),
          GraphQLField("links", type: .object(Link.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(title: String? = nil, details: String? = nil, links: Link? = nil) {
        self.init(unsafeResultMap: ["__typename": "History", "title": title, "details": details, "links": links.flatMap { (value: Link) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var details: String? {
        get {
          return resultMap["details"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "details")
        }
      }

      public var links: Link? {
        get {
          return (resultMap["links"] as? ResultMap).flatMap { Link(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "links")
        }
      }

      public struct Link: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Link"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("article", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(article: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Link", "article": article])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var article: String? {
          get {
            return resultMap["article"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "article")
          }
        }
      }
    }
  }
}
