require 'nokogiri'

doc = Nokogiri::HTML.parse <<-html
<p><b>Referral Description:</b>

 This is the body of the referral's detailed description. 
 I want to get this text out of the document.
</p>
html

node = doc.xpath('//p[./b[contains(text(), "Referral Description:")]]/following-sibling')
puts node.text