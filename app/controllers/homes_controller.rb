class HomesController < ApplicationController
  def index
  end

  def buscar
    if params[:search].present?
      @inscricao = Formulario.find(params[:search].to_i)
    end
  end

  def edital
    send_file("#{RAILS_ROOT}/public/anexo/edital.doc" , :type=>"text/msword")
  end

  def email_geral
    if params[:confirma].present?
      @geral = Formulario.all(:conditions => ["pis like '2147483647'"])
      @geral.each do |z|
        Notificador.deliver_email_geral(z)
      end
      
    end

  end

end
