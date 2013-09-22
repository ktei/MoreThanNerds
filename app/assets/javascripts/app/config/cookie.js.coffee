app.config(['$cookieStoreProvider', ($cookieStoreProvider) ->
  $cookieStoreProvider.setDefaultOptions({
    path: '/',
    expires: 365 # expires in one year
  })
])
