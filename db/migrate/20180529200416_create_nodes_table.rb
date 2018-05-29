class CreateNodesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :nodes do |t|
      t.integer('trail_id')
      t.float('latitude')
      t.float('longitude')
      t.float('elevation')
    end
  end
end
