ActiveAdmin.register Challenge do
  
  filter :gig
  filter :venture
  
  index do
    column :venture
    column :title
    column :gig
    default_actions
  end
  
  show do |challenge|
    attributes_table do
      row :gig
      row :venture
      row :title
      row :description
      row "Inspirations" do |i|
        i.bookmarks.map{ |w| w.title }.join(', ')
      end
    end
  end
  
  form do |f|
    f.inputs "Associations" do
      f.input :gig
      f.input :venture
    end
    f.inputs "Content" do
      f.input :title
      f.input :description, :input_html => { :rows => 5 }
    end
    f.inputs "Inspirations" do
      f.input :bookmarks, :as => :check_boxes
    end
    f.buttons
  end

end