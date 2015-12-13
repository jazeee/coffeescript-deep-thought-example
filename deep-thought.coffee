class DeepThought
	constructor: ->
		@startTime = new moment()
		@endTime = @startTime.add 75000000, "years"
	getAnswer: =>
		return 42 if moment().isAfter @endTime

deepThought = new DeepThought()

if Meteor.isClient
	Template.DeepThought.helpers
		theAnswer: ->
			Session.get 'answer'

	Meteor.setInterval ->
		Session.set 'answer', deepThought.getAnswer()
	1000
