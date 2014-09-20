<% if @item.errors.empty? %>
  location.reload( true )
<% else %>
  $( '.form-group' ).removeClass( 'has-error' )
  $( '.input-error' ).empty()
  <% if @item.errors.messages[:name] %>
  $( '#item-name' ).addClass( 'has-error' )
  $( '#item-name-error' ).html( '<%= escape_javascript( render partial: 'errors/form', locals: { label: '物品名', messages: @item.errors.messages[:name] } ) %>' )
  <% end %>
  <% if @item.errors.messages[:place] %>
  $( '#item-place' ).addClass( 'has-error' )
  $( '#item-place-error' ).html( '<%= escape_javascript( render partial: 'errors/form', locals: { label: '保管場所', messages: @item.errors.messages[:place] } ) %>' )
  <% end %>
  <% if @item.errors.messages[:amount] %>
  $( '#item-amount' ).addClass( 'has-error' )
  $( '#item-amount-error' ).html( '<%= escape_javascript( render partial: 'errors/form', locals: { label: '個数', messages: @item.errors.messages[:amount] } ) %>' )
  <% end %>
  <% if @item.errors.messages[:lending_period] %>
  $( '#item-lending_period' ).addClass( 'has-error' )
  $( '#item-lending_period-error' ).html( '<%= escape_javascript( render partial: 'errors/form', locals: { label: '貸出期間', messages: @item.errors.messages[:lending_period] } ) %>' )
  <% end %>
<% end %>
