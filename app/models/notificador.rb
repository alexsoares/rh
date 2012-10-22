class Notificador < ActionMailer::Base
  def inscricao_eventual(formulario = {})
    recipients formulario.email
    from  "no-reply@seducpma.com"
    subject "Inscrição com sucesso"
    body :formulario => formulario

  end  
end
