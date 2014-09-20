$('.modal-form').html( '<%= escape_javascript( render partial: "items/#{type}", locals: { item: @item } ) %>' )
$('#modal-form').modal()
