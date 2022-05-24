extends Control


func _ready():
	$LoseMessage.visible = false

func timeout():
	$LoseMessage.visible = true;
