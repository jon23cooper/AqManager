class CreateTestresults < ActiveRecord::Migration
  def change
    create_table :testresults do |t|
      t.float :value
      t.integer :testresult_date
      t.text :note
      t.references :parameter, index: true

      t.timestamps
    end
  end
end
