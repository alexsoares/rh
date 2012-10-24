class HomesController < ApplicationController
  def index
  end

  def buscar
    if params[:search].present?
      @inscricao = Formulario.find(params[:search])
    end
  end

end
