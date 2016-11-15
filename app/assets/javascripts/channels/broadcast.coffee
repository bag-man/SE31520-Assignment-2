App.cable.subscriptions.create { channel: "BroadcastChannel" },
  received: (data) ->
    console.log '!!!!!!!!!!!!!!'
    @appendLine(data)
 
  appendLine: (data) ->
    html = @createLine(data)
    $(".actioncable").append(html)
 
  createLine: (data) ->
    """
    <article class="chat-line">
      <span class="body">#{data["body"]}</span>
    </article>
    """
