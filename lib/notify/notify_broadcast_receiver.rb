class NotifyBroadcastReceiver < Android::Content::BroadcastReceiver

  def initialize(context, method)
    @method = method
    @context = context
  end

  def context
    @context
  end

  def onReceive(context, intent)
    @context.send @method, intent
  end
end