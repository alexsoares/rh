class CreateAnexo < ActiveRecord::Migration
  def self.up
    create_table "anexos" do |t|
      t.string :nome
      t.string :path
    end
    Anexo.create(:nome => "Edital", :path => "public/anexo/edital.doc")
  end

  def self.down
    drop_table "anexos"
  end
end
