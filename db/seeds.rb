admin = User.find_or_initialize_by(email: "admin@example.com")
if admin.new_record?
  admin.password = "admin1234"
  admin.role = :admin
  admin.save!
end
puts "Admin: #{admin.email} / admin1234"

