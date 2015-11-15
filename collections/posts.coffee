@Posts = new Meteor.Collection('posts');
@Search = new Meteor.Collection('searchs');

Schemas.Postss = new SimpleSchema(
	title:
		type:String
		max: 60

	content:
		type: String
		autoform:
			rows: 5

	city_dropdown:
		type: String
		label: 'City'
		allowedValues: [
			"Montreal"
			"Quebec"
			"Sherbrooke"
			"Trois-Rivi�res"
		]
		optional: true

	sport_dropdown:
		type: String
		label: 'Sport'
		allowedValues: [
			"Running"
			"Basketball"
			"Soccer"
			"Golf"
			"Ski"
		]
		optional: true

	level_dropdown:
		type: String
		label: 'Level'
		allowedValues: [
			"Beginner"
			"Intermediate"
			"Expert"
		]
		optional: true

	sport_date:
		type:Date
		optional:true
		autoValue: ->
				new Date()
)

Schemas.Posts = new SimpleSchema(
	postWrapper:
		type: Schemas.Postss
		label: " "
		optional: true


	createdAt:
		type: Date
		autoValue: ->
			if this.isInsert
				new Date()

	updatedAt:
		type:Date
		optional:true
		autoValue: ->
			if this.isUpdate
				new Date()

	owner:
		type: String
		regEx: SimpleSchema.RegEx.Id
		autoValue: ->
			if this.isInsert
				Meteor.userId()
		autoform:
			options: ->
				_.map Meteor.users.find().fetch(), (user)->
					label: user.emails[0].address
					value: user._id


)
Posts.attachSchema(Schemas.Posts)

Posts.helpers
	author: ->
		user = Meteor.users.findOne(@owner)
		if user?.profile?.firstName?
			user.profile.firstName
		else
			user?.emails?[0].address


Schemas.Params = new SimpleSchema(

	city:
		type: String
		label: 'City'
		allowedValues: [
			"Montreal"
			"Quebec"
			"Sherbrooke"
			"Trois-Rivi�res"
		]

	sport:
		type: String
		label: 'Sport'
		allowedValues: [
			"Running"
			"Basketball"
			"Soccer"
			"Golf"
			"Ski"
		]
		optional: true

	level:
		type: String
		label: 'Level'
		allowedValues: [
			"Beginner"
			"Intermediate"
			"Expert"
		]
		optional: true

	sport_date:
		type:Date
		optional:true
		autoValue: ->
			new Date()
)

Schemas.Search = new SimpleSchema(
	search:
		type: Schemas.Params
		optional: true
)

Search.attachSchema(Schemas.Search)