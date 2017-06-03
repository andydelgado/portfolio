10.times do |blog|
	Blog.create!(
		title: "My Blog Post #{blog}",
		body: "asd;flkasdjf; as;dlkfjas df;lkjasdf;aklsdjf asd;faklsjdf a;sldk
		a;slkdfja;sdlkfjas;dlkja a;sdlkfjas;dfkaj a;sldkfjas;dfkj"
	)
end

puts "10 blog posts created"

5.times do |skill|
	Skill.create!(
		title: "Rails #{skill}",
		percent_utilized: 15
	)
end

puts "5 skills created"

9.times do |project|
	Project.create!(
		title: "Project #{project}",
		subtitle: "My great service",
		body: "asd;flkj as;dlkfjasd; a;sldkjfas;dlkfj",
		main_image: "http://via.placeholder.com/600x400",
		thumb_image: "http://via.placeholder.com/350x200" 
	)
end
puts "9 projects created"