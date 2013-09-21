app.controller 'MessagesCtrl', ['$scope', ($scope) ->
  $scope.content = ''
  $scope.author = ''
  $scope.email = ''
  $scope.idle = true
  $scope.showAuthorInputs = false
  
  $scope.onMessageFormFocus = ->
    $scope.showAuthorInputs = true
  
  $scope.showError = (ngModelCtrl, error) ->
    ngModelCtrl.$error[error]
    
  $scope.getCss = (ngModelCtrl) ->
    {
      error: ngModelCtrl.$invalid && ngModelCtrl.$dirty
      success: ngModelCtrl.$valid && ngModelCtrl.$dirty
    }
    
  $scope.canSave = ->
    $scope.postMessageForm.$dirty and 
    $scope.postMessageForm.$valid and 
    $scope.idle
    
  $scope.messages = [
    {
      author: 'rui'
      content: 'agawe awgawe awecviweg awhawh'
      created_at: 'a minute ago'
      avatar: 'http://placehold.it/58x58'
    }
  ]
]