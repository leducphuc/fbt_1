ActiveAdmin.register Tour do
  permit_params :name, :duration, :price, :place_id, :category_id,
    :description, :image

  index do
    selectable_column
    column :id
    column :name
    column :price
    column :discount
    column :category
    column :place
    actions
  end

  show do
    h3 tour.name
    div do
      tour.place
      tour.category
      tour.duration
    end
    div do
      tour.description.html_safe
    end
    div do
      image_tag tour.image
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :category
      f.input :place
      f.input :name
      f.input :price
      f.input :duration
      f.input :description, as: :ckeditor
      f.input :image, as: :url
    end
    f.actions
  end

  batch_action :add_discount,
    form: -> {{discount: Discount.pluck(:name, :id)}} do |ids, inputs|
    discount = Discount.find_by_id inputs[:discount]
    Tour.find(ids).each do |tour|
      tour.update_attributes discount: discount
    end
  end
end
