(function($) {

  var _defaults = {
    lines : 11, // The number of lines to draw
    length : 0, // The length of each line
    width : 10, // The line thickness
    radius : 28, // The radius of the inner circle
    corners : 0, // Corner roundness (0..1)
    rotate : 0, // The rotation offset
    direction : 1, // 1: clockwise, -1: counterclockwise
    color : '#000', // #rgb or #rrggbb
    speed : 1, // Rounds per second
    trail : 60, // Afterglow percentage
    shadow : false, // Whether to render a shadow
    hwaccel : false, // Whether to use hardware acceleration
    className : 'spinner', // The CSS class to assign to the spinner
    zIndex : 2e9, // The z-index (defaults to 2000000000)
    top : 'auto', // Top position relative to parent in px
    left : 'auto' // Left position relative to parent in px
  };

  var _spinner;

  var methods = {
    init : function(options) {

      var $this = $(this);
      _defaults = $.extend({}, _defaults, options);
      return methods['spin'].call(this);

    },
    spin : function() {

      var $this = $(this);
      $this.append('<div class="overlay"></div>');
      _spinner = new Spinner(_defaults).spin($this[0]);
      return this;
    },
    stop : function() {

      var $this = $(this);
      $this.find('.overlay').remove();
      _spinner.spin(false);
      return this;

    }
  };

  /* SPINNER PLUGIN DEFINITION
   * ========================== */
  var old = $.fn.spinner;

  $.fn.spinner = function(options) {
    if (this.length > 0) {
      if (this.length > 1) {
        return this.each(function() {
          methods['init'].call(this, options);
        });
      }
      if (options === 'spin') {
        return methods['spin'].call(this);
      }
      if (options === 'stop') {
        return methods['stop'].call(this);
      }
      return methods['init'].call(this, options);
    }
    return false;
  };

  /* SPINNER NO CONFLICT
   * ================= */

  $.fn.spinner.noConflict = function() {
    $.fn.modal = old;
    return this;
  }
})(jQuery); 