require_relative '../config'

# using ActiveRecord migration

class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |t|
      t.string :bioguide_id, 
      :congress_office, 
      :congresspedia_url,
      :district, 
      :facebook_id, 
      :fax, 
      :fec_id, 
      :firstname, 
      :gender, 
      :lastname, 
      :middlename, 
      :name_suffix, 
      :nickname,
      :party, 
      :phone, 
      :senate_class, 
      :state, 
      :title, 
      :twitter_id,
      :webform, 
      :website, 
      :youtube_url

      t.boolean :in_office
      t.integer :votesmart_id, :govtrack_id, :crp_id
      t.date :birthdate
    end
  end
end
