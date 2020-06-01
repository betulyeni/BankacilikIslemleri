require 'mail'
class Mail_api
  def mail(body)
    options = { :address              => "smtp.gmail.com",
                :port                 => 587,
                :domain               => 'your.host.name',
                :user_name            => '*******@outlook.com',
                :password             => '123456,
                :authentication       => 'plain',
                :enable_starttls_auto => true  }

    Mail.defaults do
      delivery_method :smtp, options
    end

    Mail.deliver do
      to 'salih.atlay@outlook.com'
      from 'salih.atlay@outlook.com'
      subject 'Hesap Bilgileriniz. '
      body body
    end
  end
end

