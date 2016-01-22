command: 'curl -s "http://feeds.feedburner.com/brainyquote/QUOTEBR"'

refreshFrequency: 30000

style: """
  bottom: 50%
  right: 10%
  left: 10%
  color: rgba(0, 0, 0, 0.5)
  font-family: Helvetica Neue


  .output
    padding: 5px 10px
    width: 100%
    font-size: 80px
    font-weight: lighter
	font-smoothing: antialiased
    text-align: justify

  .author
    font-size: 60px
    text-align: right
    padding-right: 10%
"""

render: (output) -> """
  <div class="output">
    <div class="quote"></div>
    <div class="author"></div>
  </div>
"""

update: (output, domEl) -> 
  # Define constants, and extract the juicy html.
  dom = $(domEl)
  xml = jQuery.parseXML(output)
  $xml = $(xml)
  description = jQuery.parseHTML($xml.find('description').eq(1).text())
  $description = $(description)

 # Find the info we need, and inject it into the DOM.
  dom.find('.quote').html $xml.find('description').eq(2)
  dom.find('.author').html $xml.find('title').eq(2)

 
