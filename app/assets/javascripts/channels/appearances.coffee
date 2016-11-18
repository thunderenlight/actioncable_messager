jQuery(document).on 'turbolinks:load', ->
	App.personal_chat = App.cable.subscriptions.create {
		channel: "AppearancesChannel"
	},
	connected: ->

	disconnected: ->


	received: (data) ->