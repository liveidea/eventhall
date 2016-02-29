class Notifier < ApplicationMailer
   default :from => 'any_from_address@example.com'

   def send_simple_message
     RestClient.post "https://api:key-de4e1c62209b115f4b9b3c88469cc185"\
     "@api.mailgun.net/v3/sandbox97ab1d7143074cbe922c46d78ae3400f.mailgun.org/messages",
     :from => "Mailgun Sandbox <postmaster@sandbox97ab1d7143074cbe922c46d78ae3400f.mailgun.org>",
     :to => "Roman <vesna95@ukr.net>",
     :subject => "Hello Roman",
     :text => "Congratulations Roman, you just sent an email with Mailgun!  You are truly awesome!  You can see a record of this email in your logs: https://mailgun.com/cp/log .  You can send up to 300 emails/day from this sandbox server.  Next, you should add your own domain so you can send 10,000 emails/month for free."
   end

end
