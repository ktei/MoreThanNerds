app.controller 'MessagesCtrl', ['$scope', '$cookieStore', 'messageSvc', ($scope, $cookieStore, messageSvc) ->
  $scope.content = ''
  $scope.author = $cookieStore.get('messageDefaultAuthor')
  $scope.email = $cookieStore.get('messageDefaultEmail')
  $scope.idle = true
  $scope.showAuthorInputs = false
  
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
    $scope.idle
    
  $scope.postMessage = ->
    if $scope.canSave()
      $scope.idle = true
      $cookieStore.put 'messageDefaultAuthor', $scope.author
      $cookieStore.put 'messageDefaultEmail', $scope.email
      
      promise = messageSvc.post {
        author: $scope.author
        email: $scope.email
        content: $scope.content
      }
      promise.then ((response) ->
        $scope.idle = true
        data = response.data
        if data.success
          $scope.messages.push data.message
          $scope.content = ''
          $scope.postMessageForm.$setPristine()
        ), ((response) ->
          $scope.idle = true
        )
      
      
  $scope.messages = [
    {
      author: 'rui'
      content: 'agawe awgawe awecviweg awhawh'
      created_at: 'a minute ago'
      avatar: 'http://placehold.it/58x58'
    }
  ]
]