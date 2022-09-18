// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class HomeInfoQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query HomeInfo {
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
        flight {
          __typename
          ...APIflight
        }
      }
    }
    """

  public let operationName: String = "HomeInfo"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + ApIflight.fragmentDefinition)
    return document
  }

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
          GraphQLField("flight", type: .object(Flight.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(title: String? = nil, details: String? = nil, links: Link? = nil, flight: Flight? = nil) {
        self.init(unsafeResultMap: ["__typename": "History", "title": title, "details": details, "links": links.flatMap { (value: Link) -> ResultMap in value.resultMap }, "flight": flight.flatMap { (value: Flight) -> ResultMap in value.resultMap }])
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

      public var flight: Flight? {
        get {
          return (resultMap["flight"] as? ResultMap).flatMap { Flight(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "flight")
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

      public struct Flight: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Launch"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(ApIflight.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var apIflight: ApIflight {
            get {
              return ApIflight(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class LaunchesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Launches {
      launches {
        __typename
        mission_name
        launch_date_local
        launch_site {
          __typename
          site_name
        }
        rocket {
          __typename
          rocket {
            __typename
            name
            country
            height {
              __typename
              meters
            }
            mass {
              __typename
              kg
            }
            diameter {
              __typename
              meters
            }
            success_rate_pct
            description
          }
          rocket_name
        }
        launch_success
        links {
          __typename
          mission_patch_small
          mission_patch
        }
      }
    }
    """

  public let operationName: String = "Launches"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("launches", type: .list(.object(Launch.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(launches: [Launch?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "launches": launches.flatMap { (value: [Launch?]) -> [ResultMap?] in value.map { (value: Launch?) -> ResultMap? in value.flatMap { (value: Launch) -> ResultMap in value.resultMap } } }])
    }

    public var launches: [Launch?]? {
      get {
        return (resultMap["launches"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Launch?] in value.map { (value: ResultMap?) -> Launch? in value.flatMap { (value: ResultMap) -> Launch in Launch(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Launch?]) -> [ResultMap?] in value.map { (value: Launch?) -> ResultMap? in value.flatMap { (value: Launch) -> ResultMap in value.resultMap } } }, forKey: "launches")
      }
    }

    public struct Launch: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Launch"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("mission_name", type: .scalar(String.self)),
          GraphQLField("launch_date_local", type: .scalar(String.self)),
          GraphQLField("launch_site", type: .object(LaunchSite.selections)),
          GraphQLField("rocket", type: .object(Rocket.selections)),
          GraphQLField("launch_success", type: .scalar(Bool.self)),
          GraphQLField("links", type: .object(Link.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(missionName: String? = nil, launchDateLocal: String? = nil, launchSite: LaunchSite? = nil, rocket: Rocket? = nil, launchSuccess: Bool? = nil, links: Link? = nil) {
        self.init(unsafeResultMap: ["__typename": "Launch", "mission_name": missionName, "launch_date_local": launchDateLocal, "launch_site": launchSite.flatMap { (value: LaunchSite) -> ResultMap in value.resultMap }, "rocket": rocket.flatMap { (value: Rocket) -> ResultMap in value.resultMap }, "launch_success": launchSuccess, "links": links.flatMap { (value: Link) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var missionName: String? {
        get {
          return resultMap["mission_name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "mission_name")
        }
      }

      public var launchDateLocal: String? {
        get {
          return resultMap["launch_date_local"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "launch_date_local")
        }
      }

      public var launchSite: LaunchSite? {
        get {
          return (resultMap["launch_site"] as? ResultMap).flatMap { LaunchSite(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "launch_site")
        }
      }

      public var rocket: Rocket? {
        get {
          return (resultMap["rocket"] as? ResultMap).flatMap { Rocket(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "rocket")
        }
      }

      public var launchSuccess: Bool? {
        get {
          return resultMap["launch_success"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "launch_success")
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

      public struct LaunchSite: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["LaunchSite"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("site_name", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(siteName: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "LaunchSite", "site_name": siteName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var siteName: String? {
          get {
            return resultMap["site_name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "site_name")
          }
        }
      }

      public struct Rocket: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["LaunchRocket"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("rocket", type: .object(Rocket.selections)),
            GraphQLField("rocket_name", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(rocket: Rocket? = nil, rocketName: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "LaunchRocket", "rocket": rocket.flatMap { (value: Rocket) -> ResultMap in value.resultMap }, "rocket_name": rocketName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var rocket: Rocket? {
          get {
            return (resultMap["rocket"] as? ResultMap).flatMap { Rocket(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "rocket")
          }
        }

        public var rocketName: String? {
          get {
            return resultMap["rocket_name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "rocket_name")
          }
        }

        public struct Rocket: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Rocket"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("country", type: .scalar(String.self)),
              GraphQLField("height", type: .object(Height.selections)),
              GraphQLField("mass", type: .object(Mass.selections)),
              GraphQLField("diameter", type: .object(Diameter.selections)),
              GraphQLField("success_rate_pct", type: .scalar(Int.self)),
              GraphQLField("description", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String? = nil, country: String? = nil, height: Height? = nil, mass: Mass? = nil, diameter: Diameter? = nil, successRatePct: Int? = nil, description: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Rocket", "name": name, "country": country, "height": height.flatMap { (value: Height) -> ResultMap in value.resultMap }, "mass": mass.flatMap { (value: Mass) -> ResultMap in value.resultMap }, "diameter": diameter.flatMap { (value: Diameter) -> ResultMap in value.resultMap }, "success_rate_pct": successRatePct, "description": description])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var country: String? {
            get {
              return resultMap["country"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "country")
            }
          }

          public var height: Height? {
            get {
              return (resultMap["height"] as? ResultMap).flatMap { Height(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "height")
            }
          }

          public var mass: Mass? {
            get {
              return (resultMap["mass"] as? ResultMap).flatMap { Mass(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "mass")
            }
          }

          public var diameter: Diameter? {
            get {
              return (resultMap["diameter"] as? ResultMap).flatMap { Diameter(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "diameter")
            }
          }

          public var successRatePct: Int? {
            get {
              return resultMap["success_rate_pct"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "success_rate_pct")
            }
          }

          public var description: String? {
            get {
              return resultMap["description"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }

          public struct Height: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Distance"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("meters", type: .scalar(Double.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(meters: Double? = nil) {
              self.init(unsafeResultMap: ["__typename": "Distance", "meters": meters])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var meters: Double? {
              get {
                return resultMap["meters"] as? Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "meters")
              }
            }
          }

          public struct Mass: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Mass"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("kg", type: .scalar(Int.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(kg: Int? = nil) {
              self.init(unsafeResultMap: ["__typename": "Mass", "kg": kg])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var kg: Int? {
              get {
                return resultMap["kg"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "kg")
              }
            }
          }

          public struct Diameter: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Distance"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("meters", type: .scalar(Double.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(meters: Double? = nil) {
              self.init(unsafeResultMap: ["__typename": "Distance", "meters": meters])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var meters: Double? {
              get {
                return resultMap["meters"] as? Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "meters")
              }
            }
          }
        }
      }

      public struct Link: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["LaunchLinks"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mission_patch_small", type: .scalar(String.self)),
            GraphQLField("mission_patch", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(missionPatchSmall: String? = nil, missionPatch: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "LaunchLinks", "mission_patch_small": missionPatchSmall, "mission_patch": missionPatch])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var missionPatchSmall: String? {
          get {
            return resultMap["mission_patch_small"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "mission_patch_small")
          }
        }

        public var missionPatch: String? {
          get {
            return resultMap["mission_patch"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "mission_patch")
          }
        }
      }
    }
  }
}

public final class RocketsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Rockets {
      rockets {
        __typename
        name
        description
        cost_per_launch
        success_rate_pct
        mass {
          __typename
          kg
        }
        height {
          __typename
          meters
        }
        diameter {
          __typename
          meters
        }
        active
      }
    }
    """

  public let operationName: String = "Rockets"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("rockets", type: .list(.object(Rocket.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(rockets: [Rocket?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "rockets": rockets.flatMap { (value: [Rocket?]) -> [ResultMap?] in value.map { (value: Rocket?) -> ResultMap? in value.flatMap { (value: Rocket) -> ResultMap in value.resultMap } } }])
    }

    public var rockets: [Rocket?]? {
      get {
        return (resultMap["rockets"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Rocket?] in value.map { (value: ResultMap?) -> Rocket? in value.flatMap { (value: ResultMap) -> Rocket in Rocket(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Rocket?]) -> [ResultMap?] in value.map { (value: Rocket?) -> ResultMap? in value.flatMap { (value: Rocket) -> ResultMap in value.resultMap } } }, forKey: "rockets")
      }
    }

    public struct Rocket: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Rocket"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("cost_per_launch", type: .scalar(Int.self)),
          GraphQLField("success_rate_pct", type: .scalar(Int.self)),
          GraphQLField("mass", type: .object(Mass.selections)),
          GraphQLField("height", type: .object(Height.selections)),
          GraphQLField("diameter", type: .object(Diameter.selections)),
          GraphQLField("active", type: .scalar(Bool.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil, description: String? = nil, costPerLaunch: Int? = nil, successRatePct: Int? = nil, mass: Mass? = nil, height: Height? = nil, diameter: Diameter? = nil, active: Bool? = nil) {
        self.init(unsafeResultMap: ["__typename": "Rocket", "name": name, "description": description, "cost_per_launch": costPerLaunch, "success_rate_pct": successRatePct, "mass": mass.flatMap { (value: Mass) -> ResultMap in value.resultMap }, "height": height.flatMap { (value: Height) -> ResultMap in value.resultMap }, "diameter": diameter.flatMap { (value: Diameter) -> ResultMap in value.resultMap }, "active": active])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var costPerLaunch: Int? {
        get {
          return resultMap["cost_per_launch"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "cost_per_launch")
        }
      }

      public var successRatePct: Int? {
        get {
          return resultMap["success_rate_pct"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "success_rate_pct")
        }
      }

      public var mass: Mass? {
        get {
          return (resultMap["mass"] as? ResultMap).flatMap { Mass(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "mass")
        }
      }

      public var height: Height? {
        get {
          return (resultMap["height"] as? ResultMap).flatMap { Height(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "height")
        }
      }

      public var diameter: Diameter? {
        get {
          return (resultMap["diameter"] as? ResultMap).flatMap { Diameter(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "diameter")
        }
      }

      public var active: Bool? {
        get {
          return resultMap["active"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "active")
        }
      }

      public struct Mass: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Mass"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("kg", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(kg: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Mass", "kg": kg])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var kg: Int? {
          get {
            return resultMap["kg"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "kg")
          }
        }
      }

      public struct Height: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Distance"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("meters", type: .scalar(Double.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(meters: Double? = nil) {
          self.init(unsafeResultMap: ["__typename": "Distance", "meters": meters])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var meters: Double? {
          get {
            return resultMap["meters"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "meters")
          }
        }
      }

      public struct Diameter: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Distance"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("meters", type: .scalar(Double.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(meters: Double? = nil) {
          self.init(unsafeResultMap: ["__typename": "Distance", "meters": meters])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var meters: Double? {
          get {
            return resultMap["meters"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "meters")
          }
        }
      }
    }
  }
}

public struct ApIflight: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment APIflight on Launch {
      __typename
      mission_name
      details
      launch_year
      launch_success
      links {
        __typename
        video_link
      }
      rocket {
        __typename
        rocket {
          __typename
          name
          country
          description
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["Launch"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("mission_name", type: .scalar(String.self)),
      GraphQLField("details", type: .scalar(String.self)),
      GraphQLField("launch_year", type: .scalar(String.self)),
      GraphQLField("launch_success", type: .scalar(Bool.self)),
      GraphQLField("links", type: .object(Link.selections)),
      GraphQLField("rocket", type: .object(Rocket.selections)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(missionName: String? = nil, details: String? = nil, launchYear: String? = nil, launchSuccess: Bool? = nil, links: Link? = nil, rocket: Rocket? = nil) {
    self.init(unsafeResultMap: ["__typename": "Launch", "mission_name": missionName, "details": details, "launch_year": launchYear, "launch_success": launchSuccess, "links": links.flatMap { (value: Link) -> ResultMap in value.resultMap }, "rocket": rocket.flatMap { (value: Rocket) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var missionName: String? {
    get {
      return resultMap["mission_name"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "mission_name")
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

  public var launchYear: String? {
    get {
      return resultMap["launch_year"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "launch_year")
    }
  }

  public var launchSuccess: Bool? {
    get {
      return resultMap["launch_success"] as? Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "launch_success")
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

  public var rocket: Rocket? {
    get {
      return (resultMap["rocket"] as? ResultMap).flatMap { Rocket(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "rocket")
    }
  }

  public struct Link: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["LaunchLinks"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("video_link", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(videoLink: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "LaunchLinks", "video_link": videoLink])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var videoLink: String? {
      get {
        return resultMap["video_link"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "video_link")
      }
    }
  }

  public struct Rocket: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["LaunchRocket"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("rocket", type: .object(Rocket.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(rocket: Rocket? = nil) {
      self.init(unsafeResultMap: ["__typename": "LaunchRocket", "rocket": rocket.flatMap { (value: Rocket) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var rocket: Rocket? {
      get {
        return (resultMap["rocket"] as? ResultMap).flatMap { Rocket(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "rocket")
      }
    }

    public struct Rocket: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Rocket"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("country", type: .scalar(String.self)),
          GraphQLField("description", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil, country: String? = nil, description: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Rocket", "name": name, "country": country, "description": description])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var country: String? {
        get {
          return resultMap["country"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "country")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }
    }
  }
}
