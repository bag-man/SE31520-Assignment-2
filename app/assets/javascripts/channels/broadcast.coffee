App.cable.subscriptions.create { channel: "BroadcastChannel" },
  received: (data) ->
    @appendLine(data)
 
  appendLine: (data) ->
    html = @createLine(data)
    $(".actioncable").append(html)
 
  createLine: (data) ->
    """
    <article class="chat-line">
      <span class="body">#{data.broadcast["content"]}</span>
    </article>
    """
