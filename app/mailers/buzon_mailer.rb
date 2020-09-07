class BuzonMailer < ApplicationMailer
  def send_buzon(entry)

    @entry = entry

    @from = "Notificaciones CIMAV <notificaciones@cimav.edu.mx>"
    emails = "#{Entry::EMAIL}, #{entry.user.email}"

    mail(to: emails,  :from => @from, subject: "[Buzón] Nueva queja #{@entry.identificator}")
  end
end
