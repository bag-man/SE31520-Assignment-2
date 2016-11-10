App.cable.subscriptions.create { channel: "BroadcastChannel" },
  received: (data) ->
    @appendLine(data)
 
  appendLine: (data) ->
    html = @createLine(data)
    $(".actioncable").append(html)
 
  createLine: (data) ->
    """
    <article class="chat-line">
      <span class="speaker">#{data["sent_by"]}</span>
      <span class="body">#{data["body"]}</span>
    </article>
    """
