 call asyncomplete#register_source(asyncomplete#sources#neosnippet#get_source_options({
    \ 'name': 'neosnippet',
    \ 'whitelist': ['*'],
    \ 'completor': function('asyncomplete#sources#neosnippet#completor'),
    \ }))
