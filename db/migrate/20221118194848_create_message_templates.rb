class CreateMessageTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :message_templates do |t|
      t.string :name
      t.text :template
      t.text :is_enabled, default: true
      t.timestamps
    end
  end
end
