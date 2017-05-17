// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"
import "turbolinks"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

import $ from "./jquery.min"

$(document).on("turbolinks:load", function() {

  // Make forms which have a remote=true as an ajax form
  $("body").on("submit", "form[remote='true']", function(e) {
    e.preventDefault();
    let $form = $(this);

    $.ajax({
      method: $form.attr("method"),
      url: $form.attr("action"),
      data: $form.serialize(),
      dataType: "script",
      beforeSend: function(_jqXHR, _settings) {
        $form.find("submit").addClass("dissabled")
      },
      complete: function(_jqXHR, _textStatus) {
        $form.find("submit").removeClass("dissabled")
      },
    })
    .done(function( data ) {
      console.log(data)
    });

  });
});
