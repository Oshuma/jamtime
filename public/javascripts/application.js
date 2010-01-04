$(document).ready(function() {

  $('#collapse-subfolders').live('click', function() {
    window.location.hash = '';
    $('.subfolder').hide();
    return false;
  });

  $('.folder-link').live('click', function() {
    hashtag = $(this).attr('href').replace('/browse', '');
    window.location.hash = hashtag;

    var subfolders = $(this).siblings('.subfolder');
    if (subfolders.length == 0) {
      var folder = $(this).parent('.folder');
      $.get(this.href, function(response) {
        var subfolder = $('<div/>').addClass('subfolder').html(response);
        folder.append(subfolder);
      });
    } else {
      if (subfolders.is(':visible')) subfolders.hide();
      else subfolders.show();
    }

    return false;
  });

}); // $(document).ready()
