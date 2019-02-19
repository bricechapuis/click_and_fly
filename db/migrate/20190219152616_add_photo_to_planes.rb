class AddPhotoToPlanes < ActiveRecord::Migration[5.2]
  def change
    add_column :planes, :photo, :string
  end
end
