# bash command to generate new model:
  # rails generate model Comment commenter:string body:text article:references
    # # The (:references) keyword used in the bash command is a special data type for models.
    # It creates a new column on your database table with the provided model name appended with an _id that can hold integer values.
    # To get a better understanding, analyze the db/schema.rb file after running the migration

# next run the command: rails db:migrate

class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      # t.references line creates an integer column called article_id, an index for it, and a foreign key constraint that points to the id column of the articles table
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
