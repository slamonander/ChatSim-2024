extends CanvasLayer

@export_file("*.json") var chatFile

var currentDialogueID = 0
var dialogue = []

# Called when the node enters the scene tree for the first time.
func _ready():
	start()
	
func start():
	dialogue = load_dialogue()
	currentDialogueID = -1
	next_script()
	

func load_dialogue():
	var file = FileAccess.open("res://Dialogue/json/chat.json", FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	return content
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		next_script()
	
func next_script():
	currentDialogueID += 1
	if currentDialogueID >= len(dialogue):
		return
		
	$NinePatchRect/Chat.text = dialogue[currentDialogueID]['text']
