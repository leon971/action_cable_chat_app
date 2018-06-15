App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    alert("You have a new mention") if data.mention
    if (data.message && !data.message.blank?)
      $('#messages-table').append data.message
      scroll_bottom()
    if (data.typing_user && !data.typing_user.blank?)
      if data.typing_user == 'deleting'
        hide()
      else
        $('#st').text(data.typing_user)
        show()
      scroll_bottom()
      

$(document).on 'turbolinks:load', ->
  submit_message()
  scroll_bottom()
  hide()

submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 8
      App.room.perform("user_is_deleting")
    else 
      App.room.perform("user_is_typing") 
    if event.keyCode is 13 && !event.shiftKey
      App.room.perform("user_is_deleting")
      $('input').click()
      event.target.value = ""
      event.preventDefault()

scroll_bottom = () ->
  $('#messages').scrollTop($('#messages')[0].scrollHeight)
show = () ->
  $('#st').show()
hide = () ->
  $('#st').hide()
