require 'net/smtp'
class Mail 

  def self.new_user(first_name:, email:)
    message = <<END_OF_MESSAGE
      From:  Ducks BnB  <ducksbnbmailer@gmail.com>
      To: #{first_name} <#{email}>
      Subject: Congratulations you are signed up with Ducks BnB

    Welcome #{first_name} to Ducks BnB. 
    You are now able to list and book spaces. 
    Quack 
END_OF_MESSAGE

    Net::SMTP.start('smtp.gmail.com', 25, 'localhost:9292', ENV['DUCKBNBUSER'], ENV['DUCKPASSWORD'], :plain) do |smtp|
      smtp.send_message message,
      'ducksbnbmailer@gmail.com.com',
      "#{email}"
    end
  end
end 
