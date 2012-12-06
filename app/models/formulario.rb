class Formulario < ActiveRecord::Base
  ESTADO_CIVIL = %w(SOLTEIRO(A) CASADO(A) VIUVO(A) SEPARADO(A) DESQUITADO(A))
  DISCIPLINA = ['PROFESSORA DE CRECHE','PEB1 - INFANTIL','PEB1 - FUNDAMENTAL','PEB - EDUCAÇÃO ESPECIAL','PEB2 - PORTUGUES','PEB2 - MATEMATICA','PEB2 - CIENCIAS','PEB2 - HISTORIA','PEB2 - GEOGRAFIA','PEB2 - INGLES','PEB2 - ARTE EDUCACAO','PEB2 - EDUCACAO FISICA']
  STATUS = {'ENTREGUE' => 1, 'FALTA DOCUMENTACAO' => 0}
  has_one :apuracao, :dependent => :destroy
  validates_presence_of :dt_nasc, :nome, :cpf, :rg, :cep, :email, :graduacao, :disciplina, :horario
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message
  #validates_length_of :cpf, :within => 14..14
  #validates_length_of :cep, :within => 10..10
  #validates_length_of :rg, :within => 13..13
  #before_save :compose_celular,:compose_telefone
  attr_accessor :ddd_celular,:ddd_telefone, :telefone_numero, :celular_numero
  def outra_funcao
    if self.exerce_funcao
      "SIM"
    else
      "NÃO"
    end
  end

  def status
    if self.ativo
      "Ativo"
    else
      "Cancelado"
    end
  end

  def documentacao
    if self.documentacao_entregue
      "OK"
    else
      "Não entregue"
    end
  end

  def compose_nome
    "#{self.nome}"
  end

  def gera_log(usuario,acao)
    log = Log.new
      log.acao = acao
      log.formulario_id = self.id
      log.user_id = usuario
    log.save
  end


  protected
  def compose_celular
    self.celular = "(#{self.ddd_celular})#{self.celular_numero}"
  end
  def compose_telefone
    self.telefone = "(#{self.ddd_telefone})#{self.telefone_numero}"
  end



end
