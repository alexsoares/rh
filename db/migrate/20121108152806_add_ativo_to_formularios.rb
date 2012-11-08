class AddAtivoToFormularios < ActiveRecord::Migration
  def self.up
    add_column :formularios, :ativo, :boolean, :default => 1
  end

  def self.down
    remove_column :formularios, :ativo
  end
end
