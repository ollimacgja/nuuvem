# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w(Ação Action Aventura Adventure Tiro Shooter Terror Horror RPG RPG).in_groups_of(2).each do |pt, en|
  category = Category.new
  category.attributes = {name: pt, locale: :'pt-BR'}
  category.attributes = {name: en, locale: :en}
  category.save
end

User.create(email: 'admin@admin.com', password: '123456', admin: true)
User.create(email: 'dev@dev.com', password: '654321', admin: true)

desc_pt = 'Evidentemente, a crescente influência da mídia é uma das consequências das regras de conduta normativas. No entanto, não podemos esquecer que a complexidade dos estudos efetuados cumpre um papel essencial na formulação da gestão inovadora da qual fazemos parte. Acima de tudo, é fundamental ressaltar que a hegemonia do ambiente político promove a alavancagem do sistema de participação geral.'
desc_en = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc porta mauris ac sapien facilisis, id feugiat turpis viverra. Donec pharetra tellus nec sollicitudin interdum. Ut in posuere sapien. Praesent sed viverra ligula. Aenean arcu turpis, bibendum vitae bibendum nec, consectetur sed magna. Duis quis felis elementum lectus cursus semper id viverra felis. Nullam eu blandit nisl, vel ultrices leo.'

shooter = Category.with_translations.where(name: 'Shooter').first
rpg = Category.with_translations.where(name: 'RPG').first
horror = Category.with_translations.where(name: 'Horror').first

Game.create(name: 'The Elder Scrolls V: Skyrim', boxshot: 'http://wallpaper.ultradownloads.com.br/277335_Papel-de-Parede-The-Elder-Scrolls-V-Skyrim--277335_1280x800.jpg', category: rpg, published: true, description_en: desc_en, description_pt_br: desc_pt)
Game.create(name: 'Fallout 4', boxshot: 'https://images2.alphacoders.com/637/637389.jpg', category: rpg, published: true, description_en: desc_en, description_pt_br: desc_pt)
Game.create(name: 'Dragon Age', boxshot: 'https://i.ytimg.com/vi/GuVs8DTdA7U/maxresdefault.jpg', category: rpg, published: true, description_en: desc_en, description_pt_br: desc_pt)
Game.create(name: 'The Witcher III: Wild Hunt', boxshot: 'http://static.cdprojektred.com/thewitcher.com/media/wallpapers/witcher3/full/witcher3_en_wallpaper_the_witcher_3_wild_hunt_geralt_with_trophies_1600x1200_1449484679.png', category: rpg, published: true, description_en: desc_en, description_pt_br: desc_pt)
Game.create(name: 'Mass Effect', boxshot: 'https://i.ytimg.com/vi/uhesDs6FWpo/maxresdefault.jpg', category: rpg, published: true, description_en: desc_en, description_pt_br: desc_pt)
Game.create(name: 'Dark Souls III', boxshot: 'https://d1r7xvmnymv7kg.cloudfront.net/sites_products/darksouls3/assets/img/DARKSOUL_facebook_mini.jpg', category: rpg, published: true, description_en: desc_en, description_pt_br: desc_pt)
Game.create(name: 'Battlefield 4', boxshot: 'http://media-www-battlefieldwebcore.spark.ea.com/content/battlefield-portal/pt_BR/games/battlefield-4/_global_/_jcr_content/ccm/componentwrapper_0/components/opengraph/ogImage.img.jpg', category: shooter, published: true, description_en: desc_en, description_pt_br: desc_pt)
Game.create(name: 'Counter Stirke: Global Offensive', boxshot: 'https://global-offensive.com/wp-content/uploads/sites/2/2014/02/counter-strike-global-offensive-game-hd-wallpaper-1920x1080-8976.jpg', category: shooter, published: true, description_en: desc_en, description_pt_br: desc_pt)
Game.create(name: 'Dying Light', boxshot: 'https://media.playstation.com/is/image/SCEA/dying-light-listing-thumb-01-ps4-us-07jan15?$Icon$', category: horror, published: true, description_en: desc_en, description_pt_br: desc_pt)
Game.create(name: 'Silent Hill', boxshot: 'http://images-cdn.moviepilot.com/image/upload/c_fill,h_1080,w_1920/t_mp_quality/silent-hill-504e9a3667be8-silent-hill-silent-hills-what-does-the-future-hold-jpeg-160174.jpg', category: horror, published: true, description_en: desc_en, description_pt_br: desc_pt)
