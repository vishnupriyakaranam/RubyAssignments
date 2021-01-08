originaldraftsubject = ""
originalsentmailsubject = ""
actualsentmailsubject = ""
originalsentmailcontent = ""
actualinboxmailcontent = ""
inbox_starredmailsubject = ""
starred_starredmailsubject = ""
Given(/^Navigate to Gmail$/) do
  visit(HomePage)
  on(HomePage).visit_gmail
end
When(/^Logged in using username as "([^"]*)" and password as "([^"]*)"$/) do |username, password|
  on(HomePage).to_click("user_name")
  @browser.send_keys username
  @browser.send_keys :enter
  on(HomePage).to_click("pass_word")
  @browser.send_keys password
  on(HomePage).to_click("next_button")
end
Then(/^Compose mail and save as draft$/)do
  on(HomePage).to_click("compose_link")
  on(HomePage).to_click("mail_to_field")
  @browser.send_keys "test52526@gmail.com"
  @browser.send_keys :enter
  originaldraftsubject = "Draft Mail ".concat(rand(1..1000).to_s)
  on(HomePage).to_click("subject_field")
  @browser.send_keys :enter
  @browser.send_keys originaldraftsubject
  on(HomePage).to_click("mail_body_field")
  @browser.send_keys "Hello\n\nThis is a Test mail\.\n\nRegards,\nVishnupriya"
  on(HomePage).to_click("draft_close")
end
And(/^Validate mail under Drafts$/)do
  on(HomePage).to_click("draft")
  actualdraftsubject = on(HomePage).get_text("draft_subject_latest")
  if actualdraftsubject == originaldraftsubject
    puts "--> Mail successfully Drafted"
  end
end
Then(/^Compose mail and self send$/)do
  on(HomePage).to_click("compose_link")
  on(HomePage).to_click("mail_to_field")
  @browser.send_keys "test52526@gmail.com"
  @browser.send_keys :enter
  originalsentmailsubject = "Sent Mail ".concat(rand(1..1000).to_s)
  on(HomePage).to_click("subject_field")
  @browser.send_keys originalsentmailsubject
  on(HomePage).to_click("mail_body_field")
  @browser.send_keys "Hi\n\nThis is a Test mail\.\n\nRegards,\nVishnupriya"
  on(HomePage).to_click("send_link")
end
And(/^Validate sent mail$/) do
  on(HomePage).to_click("sent")
  actualsentmailsubject = on(HomePage).get_text("sent_subject_latest")
  if actualsentmailsubject == originalsentmailsubject
    puts "--> Mail successfully Sent and added under sent items"
  end

  originalsentmailcontent = on(HomePage).get_text("sent_content_latest")
  on(HomePage).to_click("inbox")
  actualinboxmailcontent = on(HomePage).get_text("inbox_mail_content_latest")
  if originalsentmailcontent == actualinboxmailcontent
    puts "--> Self Mail successfully Sent"
  end
end
Then(/^Star the mail under Inbox$/)do
  on(HomePage).to_click("star_icon_inbox")
end
And(/^Validate mail under Starred$/) do
  inbox_starredmailsubject = on(HomePage).get_text("inbox_starred_subject")
  on(HomePage).to_click("starred")
  starred_starredmailsubject = on(HomePage).get_text("starred_subject_latest")
  if inbox_starredmailsubject == starred_starredmailsubject
    puts "--> Successfully starred a mail"
  end
end

