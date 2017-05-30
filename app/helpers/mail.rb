# require 'sendgrid-ruby'
# include SendGrid


# def sendgrid_email(from, to, subject, content)
#
#   sendgrid_from = Email.new(email: from)
#   sendgrid_to = Email.new(email: to)
#   sendgrid_content = Content.new(type: 'text/plain', value: content)
#   mail = Mail.new(sendgrid_from, subject, sendgrid_to, sendgrid_content)
#
#   sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
#   response = sg.client.mail._('send').post(request_body: mail.to_json)
#   puts response.status_code
#   puts response.body
#   puts response.headers
# end
