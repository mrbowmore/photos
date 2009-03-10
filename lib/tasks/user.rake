namespace :create do
 
  desc "Creates an initial admin"
  task :admin => :environment do
    user = User.find_by_login("SuperUser")
    user.destroy unless user.nil?
    user = User.create!(:login => "SuperUser", :password => "usersuper", :password_confirmation => "usersuper", :email => "superuser@supermail.com", :admin => true)
    puts "admin successfully created"
  end
  
  desc "Creates an initial album"
  task :album => :environment do
    album = Album.find_by_title("test")
    album.destroy unless album.nil?
    album = Album.create!(:title => "test", :user_id => User.find_by_login("SuperUser").id)
    puts "album successfully created"
  end
  
  task :all => [:admin, :album]
end
