extends CanvasLayer
signal start_game

func update_score(value):
	$MarginContainer/Score.text = str(value)

func update_timer(value):
	$MarginContainer/Time.text = str(value)
	
func show_message(text):
	$Message.text = text
	$Message.show()
	$Timer.start()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	$Message.hide()


func _on_start_button_pressed():
	$"Start Button".hide()
	$Message.hide()
	start_game.emit()

func show_game_over():
	show_message("Game Over")
	await $Timer.timeout
	$"Start Button".show()
	$Message.text = "Coin Dash!"
	$Message.show()
