# Notify

A more light interface to using the LocalBroadcastManager

## Installation

Add this line to your application's Gemfile:

    gem 'notify', :git => 'git@git.medware.dk:ulrik/notify.git'

And then execute:

    $ bundle


```ruby

    Notify.application_context = getApplicationContext()
  
    @event = Notify.register(self, "event-name", :handle_event)


    Notify.broadcast "event-name" do |intent|
      intent.putExtra("message", "This is my message!")
    end
    Notify.broadcast "event-name" 


    Notify.unregister(@event)

```





