require "page-object"

class HomePage
  include PageObject

  text_field(:user_name, { :id => 'identifierId' })
  text_field(:pass_word, { :xpath => '//input[@type="password"]' })
  element(:next_button, { :xpath => '//*[@id="passwordNext"]/div[1]' })

  div(:compose_link, { :xpath => '(//div[@class="T-I T-I-KE L3"])' })
  element(:mail_to_field, {:xpath => '(//textarea[@class="vO"])[1]'})
  text_field(:subject_field, {:xpath => '(//input[@class="aoT"])'})
  div(:mail_body_field, {:xpath => '(//div[@class="Am Al editable LW-avf tS-tW"])'})
  image(:draft_close, {:xpath => '(//img[@src="images/cleardot.gif"and@class="Ha"])'})

  a(:draft, {:xpath => '(//a[@class="J-Ke n0"])[5]'})
  element(:draft_subject_latest, {:xpath => '((((//*[@id=":1"]/div/div[2])//table)[@class="F cf zt"][last()])//tr//span[@class="bog"]/span)[1]'})

  div(:send_link, {:xpath => '//div[@class="T-I J-J5-Ji aoO v7 T-I-atl L3"]'})

  a(:sent, {:xpath => '(//a[@class="J-Ke n0"])[4]'})
  element(:sent_subject_latest, {:xpath => '((((//*[@id=":1"]/div/div[3])//table)[@class="F cf zt"][last()])//tr//span[@class="bog"]/span)[1]'})

  span(:sent_content_latest, {:xpath => '((((//*[@id=":1"]/div/div[3])//table)[@class="F cf zt"][last()])//tr//span[@class="y2"])[1]'})
  element(:inbox, {:xpath => '(//a[@class="J-Ke n0"])[1]'})
  span(:inbox_mail_content_latest, {:xpath => '((((//*[@id=":1"]/div/div[1])//table)[@class="F cf zt"][last()])//tr//span[@class="y2"])[1]'})

  element(:star_icon_inbox, {:xpath => '(((//*[@id=":1"]/div/div[1])//table)[@class="F cf zt"][last()])//tr//span[@class="aXw T-KT"]'})

  element(:inbox_starred_subject, {:xpath => '((((//*[@id=":1"]/div/div[1])//table)[@class="F cf zt"][last()])//tr//span[@class="bog"]/span)[1]'})
  a(:starred, {:xpath => '(//a[@class="J-Ke n0"])[2]'})
  element(:starred_subject_latest, {:xpath => '((((//*[@id=":1"]/div/div[3])//table)[@class="F cf zt"][last()])//tr//span[@class="bog"]/span)[1]'})

  def to_click(field_name)
      send("#{field_name}_element").click
  end
  def get_text(field_name)
    send("#{field_name}_element").inner_html
  end
  def visit_gmail
    @browser.goto "https://www.gmail.com/"
  end
end