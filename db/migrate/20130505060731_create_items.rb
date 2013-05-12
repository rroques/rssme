class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.date :pub_date
      t.xml :content

      t.timestamps
    end
  end
end
