extends Node3D
## Placeholder boot scene: an empty island with a stand-in town center.

@onready var _version_label: Label = %VersionLabel


func _ready() -> void:
	_version_label.text = "Town Life v%s" % GameVersion.current()
