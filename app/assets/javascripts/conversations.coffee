jQuery(document).on 'turbolinks:load', ->
	messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))
	messages = $('#conversation-body')
	

	if $('#current-user').size() > 0
		App.personal_chat = App.cable.subscriptions.create {
			channel: "NotificationsChannel"
		},
		send_message: (message, conversation_id) ->
			@perform 'send_message', message: message, conversation_id: conversation_id
		connected: ->
			# Called when the subscription is ready for use the server

		disconnected: ->
			# Called when the subscription has been terminated by the server

		received: (data) ->
			# Called when data is received
			if messages.size() > 0 && messages.data('conversation_id') is data['conversation_id']
				messages.append data['message']
				messages_to_bottom()
			else
				$.getScript('/conversations') if $('#conversations').size() > 0
				$('body').append(data['notification']) if data['notification']
	
	$(document).on 'click', '#notification .close', ->
		$(this).parents('#notification').fadeOut(1000)

