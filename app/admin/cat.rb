ActiveAdmin.register Cat do
  filter :name
  filter :birthdate
  filter :neutered
  filter :on_sale
  filter :vaccinated
  filter :breed

  permit_params :name, :breed_id, :birthdate, :ownered_by, :neutered, :on_sale, :sex, :vaccinated

  index do
    selectable_column
    id_column
    column :name
    column :sex do |cat|
      I18n.t "activerecord.attributes.cat.sexes.#{cat.sex}"
    end
    column :breed
    column :birthdate
    column :age do |cat|
      if cat.birthdate.present?
        age = cat.age
        age >= 1 ? age : nil
      end
    end
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    inputs do
      input :name
      #input :breed, as: :select, collection: Breed.pluck(:name, :id)
      input :breed
      input :sex, as: :select, collection: I18n.t('activerecord.attributes.cat.sexes.').invert.to_a
      input :birthdate
      input :ownered_by, as: :select, collection: I18n.t('activerecord.attributes.cat.ownered_by_values.').invert.to_a
      input :neutered
      input :vaccinated
      input :on_sale
    end
    actions
  end

end
