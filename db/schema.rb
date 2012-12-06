# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121206165745) do

  create_table "anexos", :force => true do |t|
    t.string "nome"
    t.string "path"
  end

  create_table "apuracaos", :force => true do |t|
    t.integer  "formulario_id"
    t.decimal  "n_pontos",      :precision => 10, :scale => 3, :default => 0.0
    t.decimal  "nota_prova",    :precision => 10, :scale => 3, :default => 0.0
    t.decimal  "total",         :precision => 10, :scale => 3, :default => 0.0
    t.string   "curso"
    t.boolean  "aprovada"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formularios", :force => true do |t|
    t.string   "nome"
    t.date     "dt_nasc"
    t.string   "estado_civil"
    t.integer  "n_filhos"
    t.string   "endereco"
    t.integer  "numero"
    t.string   "complemento"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "cep",                   :limit => 20
    t.string   "pis"
    t.string   "cpf"
    t.string   "rg"
    t.string   "telefone",              :limit => 18
    t.string   "celular",               :limit => 18
    t.string   "email"
    t.boolean  "exerce_funcao"
    t.string   "graduacao"
    t.string   "funcao"
    t.string   "disciplina"
    t.string   "horario"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "ativo",                               :default => true
    t.boolean  "documentacao_entregue"
    t.string   "obs"
  end

  create_table "logs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "formulario_id"
    t.string   "acao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
