ActiveAdmin.register Product do
  permit_params :name, :description, :price, :image, category_ids: []

  index do
    selectable_column
    column :id
    column :name
    column :description
    column :price
    column :cateories do |product|
      product.categories.map(&:name).join(", ").html_safe
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :cateories do
        product.categories.map(&:name).join(", ").html_safe
      end
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Product" do
      f.input :name
      f.input :description
      f.input :price
      f.input :image, as: :file
      f.input :categories, as: :select, input_html: { multiple: true }
    end

    f.actions
  end
end
