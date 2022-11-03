<% if @user.admin? %>
    <li>
    <%= link_to 'Page admin', admin_users_path, target: "_blank" %>
    </li>
<% end %>