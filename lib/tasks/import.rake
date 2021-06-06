namespace :import do
  desc "Import data from spreadsheet" # update this line
  task data: :environment do
  	puts 'Importing Data' # add this line

  	data = Roo::Spreadsheet.open('lib/menu.xlsx') # open spreadsheet
  	#data.default_sheet = data.sheets[2]
    headers = data.row(1) # get header row
    data.each_with_index do |row, idx|
      next if idx == 0 # skip header row
      # create hash from headers and cells
      product_data = Hash[[headers, row].transpose]
      # next if user exists
      if Product.exists?(name: product_data['name'])
        puts "Product with name #{product_data['name']} already exists"
        next
      end
      
      product = Product.new(product_data)
      puts "Saving Product with name '#{product.name}'"
      product.save!
    end
  end
end