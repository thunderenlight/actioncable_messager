jQuery(document).on 'turbolinks:load', ->
	messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))
	messages = $('#')