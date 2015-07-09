# Notify

A more light interface to using the LocalBroadcastManager

## Installation

Add this line to your application's Gemfile:

    gem 'notify', :git => 'git@git.medware.dk:android/notify.git'

And then execute:

    $ bundle


## Usage

```ruby

class MainActivity < Android::App::Activity
  def onCreate(savedInstanceState)
    super

    Notify.application_context = getApplicationContext()
  
    @event = Notify.register(self, "event-name", :receive)

    Notify.broadcast "event-name" do |intent|
      intent.putExtra("message", "This is my message!")
    end

  end

  def onDestroy
    Notify.unregister(@event)
    super
  end

  def receive intent
    message = intent.getExtras.get 'message'

    puts "We are in and have message: '#{message}'"
  end

end


```





