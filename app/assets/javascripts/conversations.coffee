jQuery(document).on 'turbolinks:load', ->
	messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))
	messages = $('#conversation-body')
	

	if $('#current-user').size() > 0
		App.personal_chat = App.cable.subscriptions.create {
			channel: "NotificationsChannel"
		},
		connected: ->
			# Called when the subscription is ready for use the server

		disconnected: ->
			# Called when the subscription has been terminated by the server

		received: (data) ->
			# Called when data is received
		if messages.length > 0
			messages_to_bottom()
			$('#new_personal_message').submit (e) ->
				$this = $(this)
				textarea = $this.find('#personal_message_body')
				if $.trim(textarea.val()).length > 1
					App.personal_chat.send_message textarea.val(), $this.find('#conversation_id').val()
					textarea.val('')
				e.preventDefault()
				return false
