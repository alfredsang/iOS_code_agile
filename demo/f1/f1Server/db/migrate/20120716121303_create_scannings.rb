class CreateScannings < ActiveRecord::Migration
  def change
    create_table :scannings do |t|
      t.string :scanUrl
      t.string :scanDate
      t.string :scanTitle

      t.timestamps
    end
  end
end
