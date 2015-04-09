class AddPlaceToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :place, :string
  end
end
