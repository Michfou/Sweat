Schemas.UserProfile = new SimpleSchema(

  picture:
    type: String
    optional:true
    label: 'Profile picture'
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'ProfilePictures'

  firstName:
    type: String
    optional: true

  lastName:
    type: String
    optional: true

  birthday:
    type: Date
    optional: true

  bio:
    type: String
    label: 'Description'
    optional: true
    autoform:
      rows: 4

  location:
    type: String
    optional: true
    autoform:
      type: 'map'
      geolocation: true
      searchBox: true
      autolocate: true

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

  niveau_dropdown:
    type: String
    label: 'Level'
    allowedValues: [
      "Beginner"
      "Intermediate"
      "Expert"
    ]
    optional: true

  motivation_dropdown:
    type: String
    label: 'Motivation'
    allowedValues: [
      "Competitive"
      "Noncompetitive"
    ]
    optional: true


)

Schemas.User = new SimpleSchema(

  username:
    type: String
    regEx: /^[a-z0-9A-Z_]{3,15}$/
    optional: true


  emails:
    type: [Object]
    optional: true

  "emails.$.address":
    type: String
    regEx: SimpleSchema.RegEx.Email

  "emails.$.verified":
    type: Boolean

  createdAt:
    type: Date

  profile:
    type: Schemas.UserProfile
    optional: true

  services:
    type: Object
    optional: true
    blackbox: true

  roles:
    type: [String]
    blackbox: true
    optional: true
)

Meteor.users.attachSchema Schemas.User

# Export schemas
@StarterSchemas = Schemas
