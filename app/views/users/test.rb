              <a data-toggle="tab" href="#chatroom-<%= chatroom.id%>">
                <% if current_user.id == chatroom.owner_id %>
                  <%= (User.find(chatroom.client_id)).name %>
                <% else %>
                  <%= (User.find(chatroom.owner_id)).name %>
                <% end %>
              </a>