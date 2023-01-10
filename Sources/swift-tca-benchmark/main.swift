import Benchmark
import TCA

Benchmark.main([
  defaultBenchmarkSuite,
  dependenciesSuite,
  effectSuite,
  storeScopeSuite,
  viewStoreSuite,
])
