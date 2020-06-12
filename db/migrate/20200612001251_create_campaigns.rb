class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :img_url
      t.text :content
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
