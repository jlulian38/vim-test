if !exists('g:test#scala#gradletest#file_pattern')
  let g:test#scala#gradletest#file_pattern = '\v^([Tt]est.*|.*[Tt]est(s|Case)?)|.*Spec\.scala$'
endif

function! test#scala#gradletest#test_file(file) abort
  return a:file =~? g:test#scala#gradletest#file_pattern
endfunction

function! test#scala#gradletest#build_position(type, position) abort
  let filename = fnamemodify(a:position['file'], ':t:r')

  if a:type ==# 'nearest'
    let name = s:nearest_test(a:position)
    if !empty(name)
      return ['--tests ' . name]
    else
      return ['--tests ' . filename]
    endif
  elseif a:type ==# 'file'
    return ['--tests ' . filename]
  else
    return []
  endif
endfunction

function! test#scala#gradletest#build_args(args) abort
  return a:args
endfunction

function! test#scala#gradletest#executable() abort
  return './gradlew test'
endfunction

function! s:nearest_test(position) abort
  let name = test#base#nearest_test(a:position, g:test#scala#patterns)
  return escape(join(name['namespace'] + name['test'], '#'), '#')
endfunction
