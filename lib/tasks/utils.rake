namespace :utils do

  desc "find_diff "
  task(:find_diff  => :environment) do |t|
    Spec.all.each do |spec|
      puts "#{spec.bh}" if ! spec.bh=="#{spec.product.bh}-#{spec.color.bh}"
    end
  end

  desc "upload pic and db"
  task(:upload => :environment) do |t|
    require 'net/ssh'
  	require 'net/sftp'

    pic_local_path = "/public/products"
    db_local_path = "/db"
    remote_path = '/data/www/decool/current'
    local_paths=[
      "/public/products",
      "/db"
    ]

  	Net::SSH.start('42.120.19.221', 'root',:password => 'hhg1024') do |ssh|
  	 ssh.sftp.connect do |sftp|
        local_paths.each do |local_path|
          puts 'Checking for files which need updating'
    	    Dir.foreach("#{Rails.root}#{local_path}") do |file|
           local_file = "#{Rails.root}#{local_path}/#{file}"
           remote_file= "#{remote_path}#{local_path}/#{file}"
    	     next if File.stat(local_file).directory?
            begin
               local_file_changed = File.stat(local_file).mtime > Time.at(sftp.stat!(remote_file).mtime) 
               # puts "local:#{File.stat(file).mtime}"
               # puts "remote:#{Time.at(sftp.stat!("/home/rails/#{file}").mtime) }"
            rescue 
              not_uploaded = true 
            end 
            if not_uploaded or local_file_changed 
              # puts local_file_changed
              puts "#{file} has changed and will be uploaded" 
              sftp.upload!(local_file, remote_file) 
            end 
    	    end
    	 end
      end  # end connect
      
  	end
    puts 'File transfer complete'
  end

end