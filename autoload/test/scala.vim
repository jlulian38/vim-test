" there's not an obvious way to identify tests in a scalatest file...
let test#scala#patterns = {
    \ 'test': ['\v^\s*class (\w+)'],
    \ 'namespace': ['\v^\s*class (\w+)']
}
