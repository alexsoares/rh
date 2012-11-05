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

end
