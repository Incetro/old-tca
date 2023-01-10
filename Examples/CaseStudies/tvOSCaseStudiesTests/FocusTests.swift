import TCA
import XCTest

@testable import tvOSCaseStudies

@MainActor
final class tvOSCaseStudiesTests: XCTestCase {
}

/// A linear congruential random number generator.
struct LCRNG: RandomNumberGenerator {
  var seed: UInt64

  init(seed: UInt64 = 0) {
    self.seed = seed
  }

  mutating func next() -> UInt64 {
    self.seed = 2_862_933_555_777_941_757 &* self.seed &+ 3_037_000_493
    return self.seed
  }
}
