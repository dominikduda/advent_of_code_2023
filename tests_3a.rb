class FailedTestError < StandardError; end

matrix = [
  'x..'.chars,
  '.9.'.chars,
  '...'.chars
]
throw FailedTestError if calculate_sum(matrix) != 9

matrix = [
  '.x.'.chars,
  '.9.'.chars,
  '...'.chars
]
throw FailedTestError if calculate_sum(matrix) != 9

matrix = [
  '..x'.chars,
  '.9.'.chars,
  '...'.chars
]
throw FailedTestError if calculate_sum(matrix) != 9

matrix = [
  '...'.chars,
  '.9x'.chars,
  '...'.chars
]
throw FailedTestError if calculate_sum(matrix) != 9

matrix = [
  '...'.chars,
  '.9.'.chars,
  '..x'.chars
]
throw FailedTestError if calculate_sum(matrix) != 9

matrix = [
  '...'.chars,
  '.9.'.chars,
  '.x.'.chars
]
throw FailedTestError if calculate_sum(matrix) != 9

matrix = [
  '...'.chars,
  '.9.'.chars,
  'x..'.chars
]
throw FailedTestError if calculate_sum(matrix) != 9

matrix = [
  '...'.chars,
  'x9.'.chars,
  '...'.chars
]
throw FailedTestError if calculate_sum(matrix) != 9

matrix = [
  '9x'.chars,
  '..'.chars
]
throw FailedTestError if calculate_sum(matrix) != 9

matrix = [
  '9.'.chars,
  '.x'.chars
]
throw FailedTestError if calculate_sum(matrix) != 9

matrix = [
  '9.'.chars,
  'x.'.chars
]
throw FailedTestError if calculate_sum(matrix) != 9

matrix = [
  'x9'.chars,
  '..'.chars
]
throw FailedTestError if calculate_sum(matrix) != 9

matrix = [
  '.9'.chars,
  'x.'.chars
]
throw FailedTestError if calculate_sum(matrix) != 9

matrix = [
  '.9'.chars,
  '.x'.chars
]
throw FailedTestError if calculate_sum(matrix) != 9

matrix = [
  '..'.chars,
  '9x'.chars
]
throw FailedTestError if calculate_sum(matrix) != 9

matrix = [
  '.x'.chars,
  '9.'.chars
]
throw FailedTestError if calculate_sum(matrix) != 9

matrix = [
  'x.'.chars,
  '9.'.chars
]
throw FailedTestError if calculate_sum(matrix) != 9

matrix = [
  '..'.chars,
  'x9'.chars
]
throw FailedTestError if calculate_sum(matrix) != 9

matrix = [
  '.x'.chars,
  '.9'.chars
]
throw FailedTestError if calculate_sum(matrix) != 9

matrix = [
  'x.'.chars,
  '.9'.chars
]
throw FailedTestError if calculate_sum(matrix) != 9

matrix = [
  '99'.chars,
  '99'.chars
]
throw FailedTestError if calculate_sum(matrix) != 0

matrix = [
  '9.'.chars,
  '.9'.chars
]
throw FailedTestError if calculate_sum(matrix) != 0

