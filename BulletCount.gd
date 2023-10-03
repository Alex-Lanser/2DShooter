extends Label

var bullet_count = 30

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = str(player.bullet_count)
	
	if player.bullet_count > 6:
		add_theme_color_override("font_color", Color("ffffff"))
	elif player.bullet_count > 0 && player.bullet_count < 6:
		add_theme_color_override("font_color", Color("ffff00"))
	elif player.bullet_count == 0:
		add_theme_color_override("font_color", Color("ff0000"))
		
			
