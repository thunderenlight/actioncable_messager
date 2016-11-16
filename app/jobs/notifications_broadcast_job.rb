class NotificationBroadcastJob < ApplicationJob
	queue_as :default

	def perform(personal_message)