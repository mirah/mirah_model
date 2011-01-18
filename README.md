Mirah Model
================

Mirah Model is a Mirah ORM library for using AppEngine's datastore. It is inspired by ActiveRecord and DataMapper--particularly DataMapper. It's used by Dubious, a Rails-ish web framework.

Code Examples
------

If you are familar with DataMapper's property methods this should look pretty familiar. You can define properties using #property, passing the property name and a type.

    import com.google.appengine.api.datastore.* 

    class Shout < Model
      property 'title', String
      property 'body',  Text
    end

You can set instances by updating their attrs individually,

    shout = Shout.new
    shout.title = 'foo'
    shout.body  = 'bar'
    shout.save

or by using the update method and passing a hash

    shout = Shout.new.update title: 'foo', body: 'bar'
    shout.save

Development
------------
Requires Mirah 0.0.6(unreleased) and JRuby 1.6 to compile and test.

You can build the jar by running:

   rake jar