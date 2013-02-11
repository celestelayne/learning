# Coffeescript supports classes.
# They're all anonymous functions under the hood though

# Class Methods
class Song
  # This class variable is directly accessible, but the _ makes it, by convention, a not to touch
  # Only way to make it truly private is to scope it within a closure. Hacky times.
  @_titles: 0

  @getCount: ->
    @_titles

  # @ == this
  # The constructor takes an artist and a title. Assign them as properties of the new song
  constructor: (@artist, @title) ->
    Song._titles++

console.log Song.getCount() # returns 0

someSong = new Song('Radiohead', '2 + 2 = 5 (The Lukewarm)')

console.log Song.getCount() # returns 1

try
  someSong.getCount()
catch e
  console.log "someSong.getCount() isn't a thing. It's only on the class"




# Instance Methods
class SongOfFire
  # Same shpiel as above with the _, except now it's an instance variable
  _titles: 0

  getCount: ->
    @_titles

  constructor: (@artist, @title) ->
    @_titles++

console.log "huh?"
someSong = new SongOfFire('Journey', "Don't stop believing")

console.log "some SongOfFire get Count:"
console.log someSong.getCount() # returns one

try
  SongOfFire.getCount()
catch e
  console.log "aw snap! SongOfFire the class doesn't have a method called getCount"
