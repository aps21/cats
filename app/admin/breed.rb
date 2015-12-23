ActiveAdmin.register Breed do
  filter :name

  permit_params :name
end
