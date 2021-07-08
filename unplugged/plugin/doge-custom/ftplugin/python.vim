" ==============================================================================
" Custom Python template based on reST
" ==============================================================================
" Preserve existing doge settings.
let b:doge_patterns = get(b:, 'doge_patterns', {})
let b:doge_supported_doc_standards = get(b:, 'doge_supported_doc_standards', [])
if index(b:doge_supported_doc_standards, 'python_custom') < 0
  call add(b:doge_supported_doc_standards, 'python_custom')
endif

let b:doge_parser = 'python'
let b:doge_insert = 'below'

" Set the new doc standard as default.
let b:doge_doc_standard = 'python_custom'

" Ensure we do not overwrite an existing doc standard.
if !has_key(b:doge_patterns, 'python_custom')
  let b:doge_patterns['python_custom'] = [
        \  {
        \  'nodeTypes': ['function_definition'],
        \    'parameters': {
        \      'format': ':param {name}: !description',
        \    },
        \    'exceptions': {
        \      'format': ':raises {name|!name}: !description',
        \    },
        \    'template': [
        \      '"""!description',
        \      '',
        \      '%(parameters|{parameters})%',
        \      '%(returnType|:rtype {returnType}: !description)%',
        \      '%(exceptions|{exceptions})%',
        \      '"""',
        \    ],
        \  },
        \]
endif
