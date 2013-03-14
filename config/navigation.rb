SimpleNavigation::Configuration.run do |navigation|  
  navigation.items do |primary|
    primary.item :books, 'Books', '#', :class=> 'dropdown' do |books|
      books.item :fiction, 'Fiction', "#"
      books.item :history, 'History', "#"
      books.item :sports, 'Sports', "#"
    end

    primary.item :music, 'Music', "#" do |music|
      music.item :rock, 'Rock', '#'
      music.item :pop, 'Pop', '#'
      music.item :alternative, 'Alternative', "#"
    end
    primary.item :dvds, 'Dvds', '#' do |dvds|
      dvds.item :drama, 'Drama', '#'
      dvds.item :action, 'Action', '#'
      dvds.item :comedy, 'Comedy', "#"
    end    
    primary.dom_class = 'nav'
  end
end