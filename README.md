# Notify

A more light interface to using the LocalBroadcastManager

## Installation

Add this line to your application's Gemfile:

    gem 'notify', :git => 'git://github.com/ulrik/notify.git'

And then execute:

    $ bundle

## Usage


### Initialize context
```ruby

class MyApp < Android::App::Application

  def onCreate
    super

    Notify.application_context = self
  end
end

```

### Receive notification in Activity
```ruby

class MainActivity < Android::App::Activity  
  include NotifiedActivity

  notify "event-name", :receive

  def receive intent
    message = intent.getExtras.get 'message'
    puts "Notification receive with message: '#{message}'"
  end

end

```

### Receive notification in Fragment
```ruby

class MyFragment < Android::App::Fragment
  include NotifiedFragment

  notify "event-name", :receive

  def receive intent
    message = intent.getExtras.get 'message'
    puts "Notification receive with message: '#{message}'"
  end

end

```

### Broadcast notification

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




