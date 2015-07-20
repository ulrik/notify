class Notify

  def self.application_context=(context)
    @application_context = context
  end 

  def self.register(context, delegate, event, method)
    filter = Android::Content::IntentFilter.new(event)
    receiver = NotifyBroadcastReceiver.new(context, delegate, method)
    manager(context).registerReceiver(receiver, filter)
    receiver
  end

  def self.unregister(receiver)
    manager(receiver.context).unregisterReceiver(receiver)
  end

  def self.broadcast(event, &block)
    raise "Notify.application_context not initialized, you could do it in the first activity" unless @application_context

    intent = Android::Content::Intent.new(event)
    yield intent if block_given?
    manager(@application_context).sendBroadcast(intent)    
  end

  private 

  def self.manager(context)
    Android::Support::V4::Content::LocalBroadcastManager.getInstance(context)
  end

end
