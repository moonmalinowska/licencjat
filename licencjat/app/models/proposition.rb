class Proposition < ActiveRecord::Base


  include MailForm::Delivery


    attributes :name, :validate => true
    attributes :email, format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i,
                                message: "Podaj adres e-mail" }
    attribute :message, :validate => true
    attribute :url, :presence => true, :format => URI::regexp(%w(http https))



    validates :email, format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i,
                                      message: "Podaj adres e-mail" }
    validates :email, :presence => true
    validates :message, :presence => true, length: {minimum:  10, too_short: 'Wiadomość musi być dłuższa niż %{count}
znaków.'}
    validates :url, :presence => true

    # Declare the e-mail headers. It accepts anything the mail method
    # in ActionMailer accepts.

    def headers
      {
          :subject => "Propozycja atrakcji",
          :to => "atrakcje.przemyslowe@gmail.com",
          :from => %("#{email}")
      }
    end

after_create

end
