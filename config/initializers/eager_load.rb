Dir[Rails.root.join("lib/*.rb")].each { |f| load f }

p "Ejectives haven't been seeded!"