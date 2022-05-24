extends Label

export (int) var currentTime = 12;

func _ready():
	format_time()
	$Timer.start()

func format_time():
	var timeWithFormat = ""
	if currentTime < 10:
		timeWithFormat = "0" + String(currentTime)
	else:
		timeWithFormat = String(currentTime)
	text = "Tiempo: " + timeWithFormat

func _on_Timer_timeout():
	currentTime -= 1
	format_time()
	if currentTime == 0:
		get_tree().call_group("level", "timeout")
		$Timer.stop()
