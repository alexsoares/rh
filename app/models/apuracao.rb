class Apuracao < ActiveRecord::Base
  belongs_to :formulario
  before_save :gera_total, :salva_curso
  attr_accessor :sel_curso
  def divulga_status
    if self.aprovada == true
      "Aprovada"
    else
      "Reprovada"
    end
  end


  protected

  def gera_total
    self.total = self.nota_prova + self.n_pontos
  end

  def salva_curso
    self.curso = self.formulario.disciplina
  end

end
