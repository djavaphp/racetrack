function populateCities(data) {
  var $element = $('#cities');
  $element.empty();
  $.each(data, function(key, value) {
    var option = $('<option/>').val(key).text(value);
    $element.append(option)
  });
  $element.removeAttr('disabled');
}
