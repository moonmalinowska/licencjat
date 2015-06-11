class Proposition < MailForm::Base

    attribute :name, :validate => true
    attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, :presence => true
    attribute :message, length: {minimum:  10}
    attribute :url, :presence => true, :format => URI::regexp(%w(http https))


    # Declare the e-mail headers. It accepts anything the mail method
    # in ActionMailer accepts.
    def headers
      {
          :subject => "My Contact Form",
          :to => "atrakcje.przemyslowe@gmail.com"
      }
    end



end
