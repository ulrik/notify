module NotifiedActivity

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def notify event_name, method_name
      notifications << [event_name, method_name] 
    end

    def notifications
      @notifications ||= []
    end
  end  

  def onCreate(savedInstanceState)
    super

    self.class.notifications.each do |n|
      events << Notify.register(self, *n)
    end
  end

  def onDestroy
    events.each do |e|
      Notify.unregister(e)
    end

    super
  end

  def events 
    @events ||= []
  end 

end
