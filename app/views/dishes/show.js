$modal = $('.modal'),
$modalBody = $('.modal .modal-body'),
$modalHeading = $('.modal .modal-header');
$modalHeading.html("<%= @dish.name %>");
$modalBody.html("<%= escape_javascript(render @dish) %>");
$modal.modal();
