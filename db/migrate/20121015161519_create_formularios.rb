class CreateFormularios < ActiveRecord::Migration
  def self.up
    create_table :formularios do |t|
      t.string :nome
      t.date :dt_nasc
      t.string :estado_civil
      t.integer :n_filhos
      t.string :endereco
      t.integer :numero
      t.string :complemento
      t.string :bairro
      t.string :cidade
      t.integer :cep
      t.integer :pis
      t.string :cpf
      t.string :rg
      t.integer :telefone
      t.integer :celular
      t.string :email
      t.boolean :exerce_funcao
      t.string :graduacao
      t.string :funcao
      t.string :disciplina
      t.string :horario

      t.timestamps
    end
  end

  def self.down
    drop_table :formularios
  end
end
