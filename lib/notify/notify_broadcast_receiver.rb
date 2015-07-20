class NotifyBroadcastReceiver < Android::Content::BroadcastReceiver

  def initialize(context, delegate, method)
    @method = method
    @context = context
    @delegate = delegate
  end

  def context
    @context
  end

  def onReceive(context, intent)
    @delegate.send @method, intent
  end
end