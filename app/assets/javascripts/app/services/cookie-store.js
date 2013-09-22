// Code below is from https://github.com/angular/angular.js/pull/2459#issuecomment-24657403
app.provider('$cookieStore', [
  function() {
    var self = this;
    self.defaultOptions = {};
  
    self.setDefaultOptions = function(options) {
      self.defaultOptions = options;
    };
  
    self.$get = function() {
      return {
        get : function(name) {
          var jsonCookie = $.cookie(name);
          if (jsonCookie) {
            return angular.fromJson(jsonCookie);
          }
        },
        put : function(name, value, options) {
          options = $.extend({}, self.defaultOptions, options);
          $.cookie(name, angular.toJson(value), options);
        },
        remove : function(name, options) {
          options = $.extend({}, self.defaultOptions, options);
          $.removeCookie(name, options);
        }
      };
    };
  }
]); 