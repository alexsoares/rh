class Formulario < ActiveRecord::Base
  ESTADO_CIVIL = %w(SOLTEIRO(A) CASADO(A) VIUVO(A) SEPARADO(A) DESQUITADO(A))
  DISCIPLINA = ['PROFESSORA DE CRECHE','PEB1 - INFANTIL','PEB1 - FUNDAMENTAL','PEB - EDUCAÇÃO ESPECIAL','PEB2 - PORTUGUES','PEB2 - MATEMATICA','PEB2 - CIENCIAS','PEB2 - HISTORIA','PEB2 - GEOGRAFIA','PEB2 - INGLES','PEB2 - ARTE EDUCACAO','PEB2 - EDUCACAO FISICA']
  def outra_funcao
    if self.exerce_funcao
      "SIM"
    else
      "NÃO"
    end
  end
end
