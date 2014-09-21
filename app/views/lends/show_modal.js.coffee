$('.modal-form').html( '<%= escape_javascript( render partial: "lends/#{type}", locals: { items: @items } ) %>' )
$('#modal-form').modal()
