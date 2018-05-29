class CreateNodesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :nodes do |t|
      t.integer('trail_id')
      t.integer('latitude')
      t.integer('longitude')
      t.integer('elevation')
    end
  end
end
