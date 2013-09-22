app.controller 'MessagesCtrl', ['$scope', '$cookieStore', 'messageSvc', ($scope, $cookieStore, messageSvc) ->
  $scope.content = ''
  $scope.author = ''#$cookieStore.get('messageDefaultAuthor') || ''
  $scope.email = ''#$cookieStore.get('messageDefaultEmail') || ''
  $scope.messages = []
  $scope.submitting = false
  $scope.fetching = false
  $scope.showAuthorInputs = false
  $scope.currentPage = 0
  $scope.hasMoreToFetch = true
  
  $scope.onMessageFormFocus = ->
    $scope.showAuthorInputs = true
  
  $scope.showError = (ngModelCtrl, error) ->
    ngModelCtrl.$error[error]
    
  $scope.getCss = (ngModelCtrl) ->
    {
      error: ngModelCtrl.$invalid and ngModelCtrl.$dirty
      success: ngModelCtrl.$valid and ngModelCtrl.$dirty
    }
    
  $scope.canSave = ->
    $scope.postMessageForm.$dirty and 
    $scope.postMessageForm.$valid and 
    not $scope.submitting
    
  $scope.postMessage = ->
    if $scope.canSave()
      $scope.submitting = true
      #$cookieStore.put 'messageDefaultAuthor', $scope.author
      #$cookieStore.put 'messageDefaultEmail', $scope.email
      
      promise = messageSvc.post {
        author: $scope.author
        email: $scope.email
        content: $scope.content
      }
      promise.then ((response) ->
        $scope.submitting = false
        data = response.data
        if data.success
          unshiftMessage data.message
          $scope.content = ''
          $scope.postMessageForm.$setPristine()
        ), ((response) ->
          $scope.submitting = false
        )
        

  fetch = (page) ->
    promise = messageSvc.fetch(page)
    promise.then ((response) ->
      data = response.data
      pushMessage m for m in data
      $scope.hasMoreToFetch = data.length >= 5
      $scope.fetching = false
    ), ((response) ->
      $scope.fetching = false
    )
  
  $scope.fetchMore = ->
    if $scope.hasMoreToFetch and not $scope.fetching
      $scope.fetching = true
      $scope.currentPage += 1
      fetch $scope.currentPage
  
  pushMessage = (message) ->
    humanize message
    $scope.messages.push message
  unshiftMessage = (message) ->
    humanize message
    $scope.messages.unshift message
  humanize = (message) ->
    message.created_at = $.timeago(message.created_at)
]