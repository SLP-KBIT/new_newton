<% if type == :new %>
$('.modal-form').html( '<%= escape_javascript( render partial: "reserves/new", locals: { item: @item } ) %>' )
<% elsif type == :edit %>
$('.modal-form').html( '<%= escape_javascript( render partial: "reserves/edit", locals: { reserves: @reserves } ) %>' )
<% elsif type == :delete %>
$('.modal-form').html( '<%= escape_javascript( render partial: "reserves/delete", locals: { reserve: @reserve } ) %>' )
<% end %>
$('#modal-form').modal()
