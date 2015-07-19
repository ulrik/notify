# Notify

A more light interface to using the LocalBroadcastManager

## Installation

Add this line to your application's Gemfile:

    gem 'notify', :git => 'git://github.com/ulrik/notify.git'

And then execute:

    $ bundle

## Usage

```ruby

class MainActivity < Android::App::Activity  
  include NotifiedActivity

  notify "event-name", :receive

  def onCreate(savedInstanceState)
    super

    #Initialize once before broadcasting notifications - ie. in a custom Application class 
    Notify.application_context = getApplicationContext()
  end

  def receive intent
    message = intent.getExtras.get 'message'
    puts "We are in and have message: '#{message}'"
  end

end


```


```ruby

class OtherActivity < Android::App::Activity  

  def onCreate(savedInstanceState)
    super

    Notify.broadcast "event-name" do |intent|
      intent.putExtra("message", "This is my message!")
    end
  end

end


```




