module NotifiedFragment

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

  def onStart
    super
    self.class.notifications.each do |n|
      events << Notify.register(activity, self, *n)
    end
  end

  def onStop
    events.each do |e|
      Notify.unregister(e)
    end

    super
  end

  def events 
    @events ||= []
  end 

end
