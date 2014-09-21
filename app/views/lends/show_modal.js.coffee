<% if type == :new %>
$('.modal-form').html( '<%= escape_javascript( render partial: "lends/new", locals: { items: @items } ) %>' )
<% elsif type == :edit %>
$('.modal-form').html( '<%= escape_javascript( render partial: "lends/edit", locals: { lends: @lends } ) %>' )
<% end %>
$('#modal-form').modal()
